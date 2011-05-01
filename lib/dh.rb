require "dirty_history/dirty_history" 
require "dirty_history/dirty_history_mixin"          

ActiveRecord::Base.send :include, DirtyHistoryMixin