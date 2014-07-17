require "uri"

require "doctorapi_wrapper/http_client/engine"
require "doctorapi_wrapper/http_client/request"

module DoctorapiWrapper
  module HttpClient
    attr_accessor :authentication_token
    attr_reader   :host

    def get(request)
      client.get(request)
    end

    def post(request)
      client.post(request)
    end

    def put(request)
      client.put(request)
    end

    def host=(url)
      @host = URI(url)
    end

    def request(args = {})
      req                         = Request.new(args)
      req.url                     = host.merge(args.fetch(:endpoint))
      req.headers[:accept]        = :json
      req.headers["X-AUTH-TOKEN"] = authentication_token

      req
    end

    private

    def client
      @http_client ||= Engine.new
    end
  end
end
