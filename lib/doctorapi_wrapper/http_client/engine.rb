require "doctorapi_wrapper/json_parser"
require "rest-client"

module DoctorapiWrapper
  module HttpClient
    class Engine
      class UnprocessableEntity < StandardError; end
      class Unauthorized < StandardError; end

      def initialize
        @json_parser = JsonParser.new
      end

      def get(request)
        # I was forced to use this workaround because RestClient handle params and headers differently in #get and #post request
        # https://github.com/rest-client/rest-client/issues/133
        data = request.headers
        data[:params] = request.params

        client.get(request.url.to_s, data, &handler)
      end

      def post(request)
        client.post(request.url.to_s, request.body, request.headers, &handler)
      end

      def put(request)
        client.put(request.url.to_s, request.body, request.headers, &handler)
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
        RestClient
      end
    end
  end
end
