module DH 
  
  autoload :Mixin, 'dirty_history/mixin'
  
  def self.setup
    yield self
  end
end

require 'rails'
require "dirty_history/dirty_history" 
require "dirty_history/mixin" 
                                      
debugger

ActiveRecord::Base.send(:include, DH::Mixin)