module CraftyClicks
  class PostcodeLookup
    attr_accessor :postcode, :geocode, :sort, :response_format, :lines

    def initialize(service, args)
      @service = service
      @args = args
    end

    def self.full_address(*args)
      new(:rapidaddress, args).make_request
    end

    def self.basic_address(*args)
      new(:basicaddress, args).make_request
    end

    def make_request
      postcode, geocode, sort, response_format, lines = *@args

      ApiBase.new(
        product: :postcode,
        service: @service,
        http_method: :post,
        params: {
          postcode: postcode,
          include_geocode: geocode,
          sort: sort,
          response: response_format,
          lines: lines,
        }
      ).perform_request
    end
  end
end
