module Broadcasting
  module Generators
    module OrmHelpers
      def orm
        Rails::Generators.options[:rails][:orm]
      end

      def orm_has_migration?
        [:active_record].include? orm
      end

      #def migration_exists?(name)
      #  Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb").grep(/\d+_#{name}.rb$/).first
      #end

      def migration_path
        @migration_path ||= File.join('db', 'migrate')
      end
    end
  end
end