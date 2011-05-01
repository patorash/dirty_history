module DirtyHistory
  
  module Mixin

    def self.included base
      base.class_eval do 
        extend ClassMethods
      end
    end       

    module ClassMethods        
    
      # call the dirty_history class method on models with fields that you want to track changes on.
      # example usage:
      # class User < ActiveRecord::Base
      #   has_dirty_history :email, :first_name, :last_name
      # end

      # pass an optional proc to assign a creator to the dirty_history object
      # example usage:
      # class User < ActiveRecord::Base
      #   has_dirty_history :email, :first_name, :last_name, :creator => proc { User.current_user }
      # end
  
      def has_dirty_history *args 
        # Mix in the module, but ensure to do so just once.
        metaclass = (class << self; self; end)
        return if metaclass.included_modules.include?(DirtyHistory::Mixin::ObjectInstanceMethods)

        has_many        :dirty_history_records, :as => :object
        before_save     :add_dirty_history
        cattr_accessor  :dirty_history_columns

        self.dirty_history_columns ||= []
    
        if args.present?
          args.each do |arg| 
            if [String,Symbol].include?(arg.class)     
              arg = arg.to_sym
              self.dirty_history_columns << arg unless self.dirty_history_columns.include?(arg)
            elsif arg.is_a?(Hash)                      
              creator_proc = arg.delete(:creator)
              send :define_method, "creator_for_dirty_history" do 
                begin
                  creator_proc.is_a?(Proc) ? creator_proc.call : nil
                rescue
                  nil
                end
              end
            end
          end
          include DirtyHistory::Mixin::ObjectInstanceMethods
        end
      end # has_dirty_history
  
      def creates_dirty_history 
        # Mix in the module, but ensure to do so just once.
        metaclass = (class << self; self; end)
        return if metaclass.included_modules.include?(DirtyHistory::Mixin::CreatorInstanceMethods)
      
        has_many        :dirty_history_records, :as => :creator
        include DirtyHistory::Mixin::CreatorInstanceMethods
      end # creates_dirty_history
    end # ClassMethods

    module ObjectInstanceMethods
      def add_dirty_history 
        return true unless self.changed?                                               
        new_dirty_history = self.class.dirty_history_columns.inject({}) { |changes_hash, col| 
          changes_hash[col] = self.send("#{col}_change") if self.send("#{col}_changed?")
          changes_hash
        }
        new_dirty_history.map { |col,vals| 
          DirtyHistoryRecord.new  :creator      => (self.creator_for_dirty_history rescue nil),
                                  :column_name  => col,
                                  :column_type  => self.class.columns_hash[col.to_s].type,
                                  :old_value    => vals[0],
                                  :new_value    => vals[1]
        }.each { |dirty_history_record| self.dirty_history_records << dirty_history_record }
      end    
    end # ObjectInstanceMethods

    module CreatorInstanceMethods
  
    end # CreatorInstanceMethods

  end # Mixin
  
end  # DirtyHistory


ActiveRecord::Base.send :include, DirtyHistory::Mixin