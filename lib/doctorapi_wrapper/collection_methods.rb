module DoctorapiWrapper
  module CollectionMethods
    def collection(items, wrapper_klass)
      items.map do |i|
        wrapper_klass.new(i)
      end
    end
  end
end
