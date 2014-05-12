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
        RestClient.get(request.url.to_s, request.headers) do |response, request, result, &block|
          case response.code
          when 422 then
            raise UnprocessableEntity.new(response)
          when 401 then
            raise Unauthorized.new(response)
          when 200 then
            @json_parser.parse response
          else
            response.return!(request, result, &block)
          end
        end
      end
    end
  end
end
