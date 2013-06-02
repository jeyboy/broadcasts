require 'broadcasting/version'
require 'broadcasting/engine'

module Broadcasting
  #mattr_accessor :yopt
  #self.yopt = []

  def self.setup
    yield self

    #ActiveAdmin.setup do |config|
    #  config.load_paths << [File.join('broadcasting', 'app', 'admin')]
    #end
  end
end
