require "oj"

module Doctorapi
  class JsonParser
    def parse(data)
      Oj.load(data)
    end
  end
end
