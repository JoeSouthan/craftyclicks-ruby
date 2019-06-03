# frozen_string_literal: true

require 'rest-client'
require 'oj'

module CraftyClicks
  class ApiBase
    attr_accessor :result
    ADDRESS_ENDPOINT = 'https://api.craftyclicks.co.uk/address/1.1'
    POSTCODE_ENDPOINT = 'http://pcls1.craftyclicks.co.uk/json'

    def initialize(product:, service:, params: {}, http_method: :get)
      @product = self.class.const_get("#{product.upcase}_ENDPOINT")
      @service = service
      @params = params.merge(key: CraftyClicks.configuration.api_key)
      @http_method = http_method
    end

    def perform_request
      process_result(
        RestClient::Request.execute(
          method: @http_method,
          url: "#{@product}/#{@service}",
          payload: @params.to_json,
          headers: { content_type: :json, accept: :json }
        )
      )
    rescue RestClient::Unauthorized, RestClient::Forbidden, RestClient::ResourceNotFound => e
      raise Exceptions::ApiError.new(e.response), "Unauthorized: #{e.response}"
    rescue RestClient::InternalServerError => e
      raise Exceptions::ApiError.new(e.response), "Server error: #{e.response}"
    end

    private

    def process_result(request)
      @result = Oj.safe_load(request)
      @result = @result.is_a?(Array) ? { 'results' => @result } : @result
      raise Exceptions::ApiError.new(result), "API Error: #{result}" if @result.keys.map { |k| k =~ /error/ }.any?

      @result
    end
  end
end
