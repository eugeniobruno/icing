require 'coverage_helper'
require 'minitest/autorun'
require 'minitest/bender'
require 'pry-byebug'
require 'icing'

require 'examples/calculator'
require 'examples/decorations/with_extra'

module Icing
  class Test < Minitest::Test
    def calculator
      Calculator.new
    end

    def with_extra(extra)
      WithExtra.new(extra)
    end
  end
end
