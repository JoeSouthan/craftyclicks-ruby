module CraftyClicks
  class AddressLookup
    def initialize(query: nil, country:, id: nil, ip_address: nil, coords: [], lines: 2)
      @query = query
      @country = country
      @id = id
      @ip_address = ip_address
      @coords = coords
      @lines = lines
    end

    def find
      ApiBase.new(
        product: :address,
        service: :find,
        http_method: :post,
        params: {
          query: @query,
          country: @country,
          id: @id,
          ip: @ip_address,
          coords: @coords
        },
      ).perform_request
    end

    def retrieve
      ApiBase.new(
        product: :address,
        service: :retrieve,
        http_method: :post,
        params: {
          country: @country,
          id: @id,
          lines: @lines
        },
      ).perform_request
    end
  end
end
