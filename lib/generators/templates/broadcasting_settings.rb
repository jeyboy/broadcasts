#FIX ME : patch for active admin lookup
ActiveAdmin.setup do |config|
  config.load_paths << File.join(Gem.loaded_specs['broadcasting'].full_gem_path, 'app', 'admin')
end

Broadcasting.setup do |config|
#  empty (O_o)
end
