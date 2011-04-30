require 'rails'
require "dirty_history/dirty_history" 
require "dirty_history/dirty_history_mixin" 

module DirtyHistory
  def self.setup
    yield self
  end
end

ActiveRecord::Base.send(:include, DirtyHistoryMixin)