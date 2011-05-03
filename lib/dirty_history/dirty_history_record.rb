class DirtyHistoryRecord < ActiveRecord::Base   
  belongs_to :creator,  :polymorphic => true
  belongs_to :object,   :polymorphic => true
  validates_presence_of :object_type, :object_id, :column_name, :column_type, :new_value
  # can't validate present of old_value because new object attributes won't have an old value
  
  scope :created_by,      lambda { |creator| where(:creator_id => creator.id, :creator_type => creator.class.name) }
  scope :for_object_type, lambda { |object_type| where(:object_type => object_type.to_s.classify) }
    
  [:new_value, :old_value].each do |attribute|
    define_method "#{attribute}" do 
      val_to_col_type(attribute)
    end
    define_method "#{attribute}=" do |val|
      self[attribute] = val.nil? ? nil : val.to_s
      instance_variable_set "@#{attribute}", val
    end
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
