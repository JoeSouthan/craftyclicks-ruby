module CraftyClicks
  class Geocode
    def self.geocode(postcodes: [], distance: {}, preserve_index: true)
      ApiBase.new(
        product: :postcode,
        service: :geocode,
        http_method: :post,
        params: {
          postcodes: postcodes,
          distance: distance,
          preserve_index: preserve_index
        },
      ).perform_request
    end
  end
end
