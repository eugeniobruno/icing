class WithExtra < Icing::Decorations::Base
  attr_reader :extra

  def initialize(extra)
    @extra = extra
  end

  def decorated(object, method_name, *args, &block)
    super + extra
  end
end