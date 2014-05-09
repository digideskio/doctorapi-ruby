require "ostruct"

module Doctorapi
  module HttpClient
    class Request < OpenStruct
      attr_reader :headers

      def initialize(*args)
        super

        @headers = {}
      end
    end
  end
end
