#FIX ME : patch for active admin lookup
ActiveAdmin.setup do |config|
  config.load_paths << File.join(Gem.loaded_specs['broadcasts'].full_gem_path, 'app', 'admin')
end

Broadcasts.setup do |config|
#  empty (O_o)
end
