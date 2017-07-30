module Icing
  module Decorations
    class Base
      def decorated(object, method_name, *args, &block)
        object.public_send(method_name, *args, &block)
      end

      def wrapping(other)
        other.within(self)
      end

      def within(other)
        other.wrapping_other(self)
      end

      def wrapping_other(other)
        decoration_factory.composite([other.to_a, self].flatten(1))
      end

      def to_a
        [self]
      end

      def method_missing(name, *args, &block)
        if name.to_s.start_with?('wrapping_')
          wrapping_other(*args)
        else
          super
        end
      end

      def respond_to_missing?(method_name, include_private = false)
        method_name.to_s.start_with?('wrapping_') || super
      end

      private

      def decoration_factory
        Icing.decoration_factory
      end
    end
  end
end
