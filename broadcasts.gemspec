# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'broadcasts/version'

Gem::Specification.new do |spec|
  spec.name          = 'broadcasts'
  spec.version       = Broadcasts::VERSION

  spec.authors       = ['Jenua Boiko']
  spec.email         = ['jeyboy1985@gmail.com']
  spec.description   = %Q{Broadcast functional}
  spec.summary       = %Q{Broadcast functional}
  spec.homepage      = 'https://github.com/jeyboy/broadcasts'
  spec.license      = 'MIT'

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.rubygems_version = %q{1.8.6}

  spec.add_dependency('rails', '>= 3.1.0')
  spec.add_dependency('haml-rails')
  spec.add_dependency('coffee-rails')
  spec.add_dependency('sass-rails')
  spec.add_dependency('jquery-rails')

  spec.add_development_dependency('rspec-rails', '~> 2.0')
  spec.add_development_dependency('factory_girl')
  spec.add_development_dependency('database_cleaner')
  spec.add_development_dependency('sqlite3')

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
