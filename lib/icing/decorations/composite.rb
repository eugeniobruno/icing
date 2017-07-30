module Icing
  module Decorations
    class Composite < Base
      attr_reader :decorations

      def initialize(decorations)
        @decorations = decorations
      end

      def within(other)
        other.wrapping_composite(self)
      end

      def wrapping_composite(composite)
        self.class.new(composite.to_a + decorations)
      end

      def to_a
        decorations
      end
    end
  end
end
