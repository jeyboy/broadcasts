require 'broadcasting/version'
require 'broadcasting/engine'

module Broadcasting
  #mattr_accessor :yopt
  #self.yopt = []

  def self.setup
    yield self
  end
end
