require "active_record"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "dirty_history/dirty_history_record" 
require "dirty_history/dirty_history_mixin"  

$LOAD_PATH.shift

ActiveRecord::Base.send :include, DirtyHistory::Mixin