module Icing
  class DecoratorFactory
    def create(undecorated_object, definition)
      return undecorated_object if definition.empty?

      nested_decorators(undecorated_object, layers(definition))
    end

    private

    def layers(definition)
      ret = []
      definition.each do |method_name, decorations|
        decorations_array = decorations.to_a.flat_map(&:to_a) # no composites
        decorations_array.each_with_index do |decoration, i|
          ret[i] = (ret[i] || {}).merge(method_name => decoration)
        end
      end

      ret
    end

    def nested_decorators(object, layers)
      outer_decorator = Decorator.new(object, layers.first)

      layers.drop(1).reduce(outer_decorator) do |undecorated_object, definition|
        Decorator.new(undecorated_object, definition)
      end
    end
  end
end
