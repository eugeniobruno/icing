module Icing
  class DecorationFactory
    def composite(decorations)
      Decorations::Composite.new(decorations.flat_map(&:to_a))
    end
  end
end
