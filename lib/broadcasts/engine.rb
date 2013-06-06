module Broadcasts
  class Engine < ::Rails::Engine
    isolate_namespace Broadcasts

    engine_name 'broadcasts'

    initializer 'broadcasts.assets.precompile' do |app|
      app.config.assets.precompile += %w(broadcasts.js.coffee broadcasts.css.sass)
    end
  end
end
