module DirtyHistory         
  module Generators
    class InstallGenerator < Rails::Generators::Base          
    
      source_root File.expand_path("../templates", __FILE__)

      def copy_dirty_history_migration
        copy_file "migration.rb", "db/migrate/create_dirty_history"
      end

    end
  end
end