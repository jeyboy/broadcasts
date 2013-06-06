require 'broadcasts/version'
require 'broadcasts/engine'

module Broadcasts
  mattr_accessor :truncate_length
  self.truncate_length = 200

  def self.setup
    yield self
  end
end
