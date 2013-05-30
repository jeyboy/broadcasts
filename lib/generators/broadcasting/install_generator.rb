require 'generators/broadcasting/install_helpers'

module Broadcasting
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Broadcasting::Generators::OrmHelpers

      source_root File.expand_path('../../', __FILE__)

      desc 'Creates initializer and migration. If ActiveAdmin install - copy page for broadcasts'
      class_option :orm

      def copy_initializer
        #unless migration_exists?('add_broadcasts')
          STDOUT << 'migrations'
          template 'active_record/add_broadcasts.rb', "db/migrate/#{Time.now.utc.strftime('%Y%m%d%H%M%S').to_i}_add_broadcasts.rb"
          template 'active_record/add_viewings.rb', "db/migrate/#{Time.now.utc.strftime('%Y%m%d%H%M%S').to_i}_add_viewings.rb"
        #end

        #STDOUT << 'config'
        #template 'templates/broadcasting_settings.rb', 'config/initializers/broadcasting_settings.rb'

        if Gem::Specification::find_all_by_name('activeadmin').any?
          STDOUT << 'activeadmin'
          template 'templates/active_admin/broadcasts.rb', 'app/admin/broadcasts.rb'
        end
      end
    end
  end
end
