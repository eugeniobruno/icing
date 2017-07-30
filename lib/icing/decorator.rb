module Icing
  class Decorator < SimpleDelegator
    attr_reader :definition

    def initialize(undecorated_object, definition)
      super(undecorated_object)
      @definition = definition
      define_decorated_methods
    end

    def undecorated_object
      __getobj__
    end

    private

    def define_decorated_methods
      definition.each do |method_name, decoration|
        define_singleton_method method_name do |*args, &block|
          decoration.decorated(undecorated_object, method_name, *args, &block)
        end
      end
    end
  end
end
