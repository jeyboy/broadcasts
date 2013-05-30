# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'broadcasting/version'

Gem::Specification.new do |spec|
  spec.name          = 'broadcasting'
  spec.version       = Broadcasting::VERSION

  gem.authors       = ['Jenua Boiko']
  gem.email         = ['jeyboy1985@gmail.com']
  gem.description   = %Q{Broadcast functional}
  gem.summary       = %Q{}
  gem.homepage      = 'https://github.com/jeyboy/broadcast'
  spec.license      = 'MIT'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.rubygems_version = %q{1.8.6}

  gem.add_dependency('rails', '>= 3.1.0')
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
