require 'generators/broadcasting/install_helpers'
#require 'rails/generators'

module Broadcasting
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Broadcasting::Generators::OrmHelpers
      include ::Rails::Generators::Migration

      source_root File.expand_path('../../', __FILE__)

      desc 'Creates initializer and migration.'
      class_option :orm

      def self.next_migration_number(dirname)
        Time.now.strftime('%Y%m%d%H%M%S')
      end

      def mount_engine
        route "mount Broadcasting::Engine => '/broadcasting'"
      end

      def add_initializer
        template 'templates/broadcasting_settings.rb', 'config/initializers/broadcasting_settings.rb'
      end

      def add_assets
        template 'templates/assets/broadcasting.css.sass', 'app/assets/stylesheets/broadcasting.css.sass'
        template 'templates/assets/broadcasting.js.coffee', 'app/assets/javascripts/broadcasting.js.coffee'
      end

      def add_active_admin_pages
        template 'templates/broadcast.rb', 'app/admin/broadcast.rb'
      end

      def create_migration
        if orm_has_migration?
          migration_template "#{generator_dir}/add_broadcasts.rb", File.join(migration_path, 'add_broadcasts.rb')
          sleep(1)
          migration_template "#{generator_dir}/add_viewings.rb", File.join(migration_path, 'add_viewings.rb')
        end
      end

      protected
        def generator_dir
          @generator_dir ||= 'active_record'
        end
    end
  end
end
