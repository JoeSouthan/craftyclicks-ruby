module CraftyClicks
  class AddressLookup
    def self.find(query:, country:, id: nil, ip_address: nil, coords: [])
      ApiBase.new(
        product: :address,
        service: :find,
        http_method: :post,
        params: {
          query: query,
          country: country,
          id: id,
          ip: ip_address,
          coords: coords
        },
      ).perform_request
    end

    def self.retrieve(country:, id:, lines: 2)
      ApiBase.new(
        product: :address,
        service: :retrieve,
        http_method: :post,
        params: {
          country: country,
          id: id,
          lines: lines
        },
      ).perform_request
    end
  end
end
