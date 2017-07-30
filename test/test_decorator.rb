require 'minitest_helper'

class TestDecorator < Icing::Test
  def test_with_no_decorations
    decorator = Icing.decorator(calculator, {})

    expected = 3
    actual = decorator.add(1, 2)

    assert_equal expected, actual
  end

  def test_with_single_decoration1
    decorator = Icing.decorator(calculator, {
      add: with_extra(3)
    })

    expected = 6
    actual = decorator.add(1, 2)

    assert_equal expected, actual
  end

  def test_with_single_decoration2
    decorator = Icing.decorator(calculator, {
      add: [with_extra(3)]
    })

    expected = 6
    actual = decorator.add(1, 2)

    assert_equal expected, actual
  end

  def test_with_irrelevant_decoration
    decorator = Icing.decorator(calculator, {
      multiply: with_extra(3)
    })

    expected = 3
    actual = decorator.add(1, 2)

    assert_equal expected, actual
  end

  def test_with_two_decorations_of_different_methods
    decorator = Icing.decorator(calculator, {
      add: with_extra(3),
      multiply: with_extra(10)
    })

    expected = 6
    actual = decorator.add(1, 2)

    assert_equal expected, actual

    expected = 12
    actual = decorator.multiply(1, 2)

    assert_equal expected, actual
  end

  def test_with_two_decorations_of_the_same_method
    decorator = Icing.decorator(calculator, {
      add: [with_extra(4), with_extra(5)]
    })

    expected = 15
    actual = decorator.add(1, 2, 3)

    assert_equal expected, actual
  end

  def test_with_three_decorations_of_the_same_method
    decorator = Icing.decorator(calculator, {
      add: [with_extra(4), with_extra(5), with_extra(6)]
    })

    expected = 21
    actual = decorator.add(1, 2, 3)

    assert_equal expected, actual
  end

  def test_with_three_noncommutative_decorations
    decorator = Icing.decorator(calculator, {
      add: [with_extra(' first'), with_extra(' second'), with_extra(' third')]
    })

    expected = 'original string first second third'
    actual = decorator.add('original', ' ', 'string')

    assert_equal expected, actual
  end

  def test_with_composite_decoration1
    decorator = Icing.decorator(calculator, {
      add: with_extra(' second').wrapping(with_extra(' first'))
    })

    expected = 'original string first second'
    actual = decorator.add('original', ' ', 'string')

    assert_equal expected, actual
  end

  def test_with_composite_decoration2
    decorator = Icing.decorator(calculator, {
      add: with_extra(' first').within(with_extra(' second'))
    })

    expected = 'original string first second'
    actual = decorator.add('original', ' ', 'string')

    assert_equal expected, actual
  end

  def test_with_composite_decoration3
    decorator = Icing.decorator(calculator, {
      add: with_extra(' first').within(with_extra(' second')).within(with_extra(' third'))
    })

    expected = 'original string first second third'
    actual = decorator.add('original', ' ', 'string')

    assert_equal expected, actual
  end

  def test_with_composite_decoration4
    decorator = Icing.decorator(calculator, {
      add: with_extra(' first').within(with_extra(' second')).within(with_extra(' third').within(with_extra(' fourth')))
    })

    expected = 'original string first second third fourth'
    actual = decorator.add('original', ' ', 'string')

    assert_equal expected, actual
  end

  def test_with_composite_decoration5
    decorator = Icing.decorator(calculator, {
      add: [with_extra(' first').within(with_extra(' second')), with_extra(' third').within(with_extra(' fourth'))]
    })

    expected = 'original string first second third fourth'
    actual = decorator.add('original', ' ', 'string')

    assert_equal expected, actual
  end

  def test_with_composite_decoration6
    decorator = Icing.decorator(calculator, {
      add: Icing.decoration_factory.composite([with_extra(' first'), with_extra(' second'), with_extra(' third')])
    })

    expected = 'original string first second third'
    actual = decorator.add('original', ' ', 'string')

    assert_equal expected, actual
  end

  def test_method_missing
    assert_raises(NoMethodError) do
      with_extra(' first').foo
    end
  end
end
