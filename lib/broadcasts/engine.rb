require 'rails'

module Broadcasts
  class Engine < ::Rails::Engine
    isolate_namespace Broadcasts

    engine_name 'broadcasts'

    initializer 'broadcasts.assets.precompile' do |app|
      app.config.assets.precompile += %w(broadcasts.js.coffee broadcasts.css.sass)
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
