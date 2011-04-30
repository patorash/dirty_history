class DirtyHistory < ActiveRecord::Base   
  belongs_to :creator,  :polymorphic => true
  belongs_to :object,   :polymorphic => true
  validates_presence_of :object_type, :object_id
  set_table_name "dirty_history"
end
