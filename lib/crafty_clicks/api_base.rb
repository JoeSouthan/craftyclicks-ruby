require 'rest-client'
require 'oj'

module CraftyClicks
  class ApiBase
    attr_accessor :result
    ADDRESS_ENDPOINT = 'https://api.craftyclicks.co.uk/address/1.1'.freeze
    POSTCODE_ENDPOINT = 'http://pcls1.craftyclicks.co.uk/json'.freeze

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
    rescue RestClient::Unauthorized, RestClient::Forbidden, RestClient::ResourceNotFound => ex
      raise Exceptions::ApiError.new(ex.response), "Unauthorized: #{ex.response}"
    rescue RestClient::InternalServerError => ex
      raise Exceptions::ApiError.new(ex.response), "Server error: #{ex.response}"
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
