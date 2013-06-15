ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
 # config.mock_with :mocha

  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  config.before(:suite) {DatabaseCleaner.clean_with(:truncation)}
  config.before {DatabaseCleaner.strategy = :transaction}
  config.before(:each, js: true) {DatabaseCleaner.strategy = :truncation}
  config.before {DatabaseCleaner.start}
  config.after {DatabaseCleaner.clean}
end