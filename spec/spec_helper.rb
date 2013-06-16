ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'broadcasts'

Dir[Broadcasts::Engine.root.join('app', '*', 'broadcasts', '*.rb')].each {|file| require file }

Dir[Broadcasts::Engine.root.join('spec/support/*.rb')].each { |f| require f }
Dir[Broadcasts::Engine.root.join('spec/support/**/*.rb')].each { |f| require f }

require 'factory_girl'
FactoryGirl.find_definitions

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => ':memory:'
)

load_schema = lambda {ActiveRecord::Migrator.up(['db/migrate', 'spec/support/fake/db'])}
silence_stream(STDOUT, &load_schema)

require 'rails'
require "rails/test_help"
require 'action_view'

require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'

RSpec.configure do |config|
 # config.mock_with :mocha

  config.include FactoryGirl::Syntax::Methods
  #config.include Broadcasts::Engine.routes.url_helpers

  #config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  config.before(:suite) {DatabaseCleaner.clean_with(:truncation)}
  config.before {DatabaseCleaner.strategy = :transaction}
  config.before(:each, js: true) {DatabaseCleaner.strategy = :truncation}
  config.before {DatabaseCleaner.start}
  config.after {DatabaseCleaner.clean}
end
