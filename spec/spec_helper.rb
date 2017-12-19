# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'crafty_clicks'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.ignore_hosts 'codeclimate.com'
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.before(:each) do
    CraftyClicks.configure do |c|
      c.api_key = 'API_KEY'
    end
  end
end
