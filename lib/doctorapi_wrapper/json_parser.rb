require "oj"

module DoctorapiWrapper
  class JsonParser
    def parse(data)
      Oj.load(data)
    end
  end
end
