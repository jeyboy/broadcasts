# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'broadcasting/version'

Gem::Specification.new do |spec|
  spec.name          = 'broadcasting'
  spec.version       = Broadcasting::VERSION

  spec.authors       = ['Jenua Boiko']
  spec.email         = ['jeyboy1985@gmail.com']
  spec.description   = %Q{Broadcast functional}
  spec.summary       = %Q{Broadcast functional}
  spec.homepage      = 'https://github.com/jeyboy/broadcast'
  spec.license      = 'MIT'

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.rubygems_version = %q{1.8.6}

  spec.add_dependency('rails', '>= 3.1.0')
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
