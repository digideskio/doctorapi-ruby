require "uri"

require "doctorapi/http_client/engine"
require "doctorapi/http_client/request"

module Doctorapi
  module HttpClient
    attr_accessor :authentication_token
    attr_reader   :host

    def get(request)
      request.headers[:accept] = :json
      request.headers["X-AUTH-TOKEN"] = authentication_token

      client.get(request)
    end

    def host=(url)
      @host = URI(url)
    end

    def request(endpoint)
      Request.new(
        url: host.merge(endpoint),
        token: authentication_token,
      )
    end

    private

    def client
      @http_client ||= Engine.new
    end
  end
end
