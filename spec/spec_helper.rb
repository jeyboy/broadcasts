ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'broadcasts'

Dir[Broadcasts::Engine.root.join('app', 'models', 'broadcasts', '*.rb')].each {|file| require file }

require 'factory_girl'
FactoryGirl.find_definitions

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => ':memory:'
)

load_schema = lambda {
  ActiveRecord::Migrator.up('db/migrate')
  #load "#{Rails.root.to_s}/db/schema.rb" # use db agnostic schema by default
  #                                       # ActiveRecord::Migrator.up('db/migrate') # use migrations
}
silence_stream(STDOUT, &load_schema)


require 'rails'
require "rails/test_help"
require 'action_view'
require 'action_controller'

require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'

#Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
 # config.mock_with :mocha

  config.include FactoryGirl::Syntax::Methods

  #config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  config.before(:suite) {DatabaseCleaner.clean_with(:truncation)}
  config.before {DatabaseCleaner.strategy = :transaction}
  config.before(:each, js: true) {DatabaseCleaner.strategy = :truncation}
  config.before {DatabaseCleaner.start}
  config.after {DatabaseCleaner.clean}
end
