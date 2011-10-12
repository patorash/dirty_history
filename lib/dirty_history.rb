require "active_record"
require 'rails3_acts_as_paranoid'

$LOAD_PATH.unshift(File.dirname(__FILE__))

autoload :DirtyHistoryRecord, "dirty_history/dirty_history_record"
require "dirty_history/dirty_history_mixin"  

$LOAD_PATH.shift

