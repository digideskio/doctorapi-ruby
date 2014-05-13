require "ostruct"

module DoctorapiWrapper
  module HttpClient
    class Request < OpenStruct
      attr_reader :headers

      def initialize(args = {})
        super

        @headers = args.fetch(:headers, {})
      end
    end
  end
end
