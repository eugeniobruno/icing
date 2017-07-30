require 'icing/version'

require 'icing/decorations/base'
require 'icing/decorations/composite'
require 'icing/decoration_factory'
require 'icing/decorator_factory'
require 'icing/decorator'

module Icing
  def self.decoration_factory
    @decoration_factory ||= DecorationFactory.new
  end

  def self.decorator(undecorated_object, definition)
    @decorator_factory ||= DecoratorFactory.new

    @decorator_factory.create(undecorated_object, definition)
  end
end
