require 'bundler/gem_tasks'



require 'rspec/core'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks
Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each {|f| load f }

desc 'Run all specs in spec directory (excluding plugin specs)'
RSpec::Core::RakeTask.new(spec: 'broadcasts:db:test:prepare')

task default: :spec
