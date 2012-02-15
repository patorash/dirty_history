class DirtyHistoryRecord < ActiveRecord::Base   
  belongs_to :creator,  :polymorphic => true
  belongs_to :object,   :polymorphic => true

  validates_presence_of :old_value,   :unless => proc { |record| record.performing_manual_update || record.object.initialize_dirty_history }
  validates_presence_of :object_type, :object_id, :column_name, :column_type, :new_value

  scope :created_by,      lambda { |creator| where(["dirty_history_records.creator_id = ? AND dirty_history_records.creator_type = ?", creator.id, creator.class.name]) }
  scope :not_created_by,  lambda { |non_creator| where(["dirty_history_records.creator_id <> ? OR dirty_history_records.creator_type <> ?", non_creator.id, non_creator.class.name]) }
  scope :for_object_type, lambda { |object_type| where(:object_type => object_type.to_s.classify) }
  scope :for_attribute,   lambda { |attribute| where(:column_name => attribute.to_s) }
  
  attr_accessor :performing_manual_update
      
  [:new_value, :old_value].each do |attribute|
    define_method "#{attribute}" do 
      val_to_col_type(attribute)
    end
    define_method "#{attribute}=" do |val|
      self[attribute] = val.nil? ? nil : val.to_s
      instance_variable_set "@#{attribute}", val
    end
  end       
       
  def action_timestamp                           
    # use revised_created_at field to update the timestamp for
    # the dirty history action while retaining data integrity
    self[:revised_created_at] || self[:created_at]
  end            
  
  private
  
  def val_to_col_type attribute
    val_as_string = self[attribute]
    return nil if val_as_string.nil?
    case self[:column_type].to_sym
    when :integer, :boolean
      val_as_string.to_i
    when :decimal, :float
      val_as_string.to_f
    when :datetime
      Time.parse val_as_string
    when :date
      Date.parse val_as_string
    else # :string, :text
      val_as_string
    end
  end
  
end
