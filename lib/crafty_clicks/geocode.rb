module CraftyClicks
  class Geocode
    def initialize(postcodes: [], distance: {}, preserve_index: true)
      @postcodes = postcodes
      @distance = distance
      @preserve_index = preserve_index
    end

    def geocode
      ApiBase.new(
        product: :postcode,
        service: :geocode,
        http_method: :post,
        params: {
          postcodes: @postcodes,
          distance: @distance,
          preserve_index: @preserve_index
        },
      ).perform_request
    end
  end
end
