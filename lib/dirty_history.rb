require "dirty_history/dirty_history" 
require "dirty_history/dirty_history_mixin" 

ActiveRecord::Base.send(:include, DirtyHistoryMixin)

module DirtyHistory
  def self.setup
    yield self
  end
end