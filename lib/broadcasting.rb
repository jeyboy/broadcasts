require 'broadcasting/version'
require 'broadcasting/engine'

module Broadcasting
  mattr_accessor :truncate_length
  self.truncate_length = 200

  def self.setup
    yield self
  end
end
