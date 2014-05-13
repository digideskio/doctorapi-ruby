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

    def host=(url)
      @host = URI(url)
    end

    def request(args = {})
      args[:url]      = host.merge(args[:endpoint])
      args[:token]    = authentication_token
      args[:headers]  = default_headers

      Request.new(args)
    end

    private

    def client
      @http_client ||= Engine.new
    end

    def default_headers
      {
        accept: :json,
        "X-AUTH-TOKEN" => authentication_token
      }
    end
  end
end
