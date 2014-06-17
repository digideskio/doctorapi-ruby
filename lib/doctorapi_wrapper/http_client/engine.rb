require "doctorapi_wrapper/json_parser"
require "rest-client"

module DoctorapiWrapper
  module HttpClient
    class Engine
      class UnprocessableEntity < StandardError; end
      class Unauthorized < StandardError; end

      attr_reader :host

      def initialize(host)
        @json_parser = JsonParser.new
        @host = host
      end

      def get(request)
        client[request.url.to_s].get(request.headers, &handler)
      end

      def post(request)
        client[request.url.to_s].post(request.body, request.headers, &handler)
      end

      private

      def handler
        Proc.new do |response, request, result, &block|
          case response.code
          when 422 then
            raise UnprocessableEntity.new(response)
          when 401 then
            raise Unauthorized.new(response)
          when 200, 201 then
            @json_parser.parse response
          else
            response.return!(request, result, &block)
          end
        end
      end

      def client
        RestClient::Resource.new(host, verify_ssl: false)
      end
    end
  end
end
