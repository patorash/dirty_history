module DirtyHistory
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base          
      
      source_root File.expand_path("../templates", __FILE__)

      def copy_dirty_history_migration
        migration_template "migration.rb", "db/migrate/create_dirty_history"
      end

    end
  end
end