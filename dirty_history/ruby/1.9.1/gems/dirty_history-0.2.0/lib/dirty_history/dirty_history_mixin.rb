module DirtyHistory 
   
  module Mixin

    class CreatorProcError < StandardError; end
    
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
                  raise CreatorProcError
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
      
        has_many :dirty_history_records, :as => :creator
        include DirtyHistory::Mixin::CreatorInstanceMethods
      end # creates_dirty_history
    end # ClassMethods

    module ObjectInstanceMethods
      
      def add_dirty_history 
        return true unless self.changed? 
                                                      
        new_dirty_history = self.class.dirty_history_columns.inject({}) do |changes_hash, column_name| 
          changes_hash[column_name] = self.send("#{column_name}_change") if self.send("#{column_name}_changed?")
          changes_hash
        end  
        
        new_dirty_history.each do |column_name,vals| 
          add_dirty_history_record column_name, vals[0], vals[1], :creator => self.creator_for_dirty_history
        end
      end    
      
      def add_dirty_history_record column_name, old_value, new_value, options={}  
        creator = options[:creator] || self.creator_for_dirty_history
        
        dhr_attributes = {
          :column_name  => column_name,
          :column_type  => self.class.columns_hash[column_name.to_s].type,
          :old_value    => old_value,
          :new_value    => new_value,
          :creator      => creator
        }               
        dhr_attributes[:created_at] = options[:created_at] if options[:created_at]
        
        self.dirty_history_records << DirtyHistoryRecord.new(dhr_attributes)
      end    
      
    end # ObjectInstanceMethods

    module CreatorInstanceMethods
  
    end # CreatorInstanceMethods

  end # Mixin
  
end # DirtyHistory


ActiveRecord::Base.send :include, DirtyHistory::Mixin