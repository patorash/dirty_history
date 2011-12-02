class CreateDirtyHistoryRecords < ActiveRecord::Migration
  def self.up
    create_table :dirty_history_records do |t|                                           
      t.references :creator,  :polymorphic => true # creates creator_type and creator_id field
      t.references :object,   :polymorphic => true # creates object_type and object_id field            
      t.string     :column_name, :length => 64
      t.string     :column_type, :length => 16 # :string, :text, :integer, :decimal, :float, :datetime, :boolean
      t.text       :old_value
      t.text       :new_value
    
      t.datetime   :created_at
      t.datetime   :updated_at
      t.datetime   :deleted_at
    end
    add_index :dirty_history_records, [:creator_id, :creator_type]
    add_index :dirty_history_records, [:object_id,  :object_type]
  end

  def self.down
    drop_table :dirty_history_records
  end
end