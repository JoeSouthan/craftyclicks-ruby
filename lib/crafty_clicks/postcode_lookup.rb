module CraftyClicks
  class PostcodeLookup
    def initialize(postcode:, geocode: true, sort: nil, response_format: :paf_compact, lines: 2)
      @postcode = postcode
      @geocode = geocode
      @sort = sort
      @response_format = response_format
      @lines = lines
    end

    def full_address
      ApiBase.new(
        product: :postcode,
        service: :rapidaddress,
        http_method: :post,
        params: address_params,
      ).perform_request
    end

    def basic_address
      ApiBase.new(
        product: :postcode,
        service: :basicaddress,
        http_method: :post,
        params: address_params,
      ).perform_request
    end

    private

    def address_params
      {
        postcode: @postcode,
        include_geocode: @geocode,
        sort: @sort,
        response: @response_format,
        lines: @lines,
      }
    end
  end
end
