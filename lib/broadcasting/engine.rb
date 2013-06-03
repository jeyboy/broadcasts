module Broadcasting
  class Engine < ::Rails::Engine
    #isolate_namespace Broadcasting

    initializer "broadcasting.assets.precompile" do |app|
      app.config.assets.precompile += %w(broadcast.js.coffee broadcast.css.sass)
    end
  end
end
