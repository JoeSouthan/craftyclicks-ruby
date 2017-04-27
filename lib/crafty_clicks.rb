require 'crafty_clicks/address_lookup'
require 'crafty_clicks/api_base'
require 'crafty_clicks/api_base/exceptions'
require 'crafty_clicks/configuration'
require 'crafty_clicks/geocode'
require 'crafty_clicks/postcode_lookup'
require 'crafty_clicks/version'

module CraftyClicks
  class << self
    attr_accessor :api_key
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
