ActiveAdmin.setup do |config|
  config.load_paths << File.join(Gem.loaded_specs['broadcasts'].full_gem_path, 'app', 'admin')
end