require File.expand_path('../../test_helper', __FILE__)

class PropertyRectangleTest < Test::Unit::TestCase
  def rectangle(str)
    Css::Ruleset.new('h1', str).properties.first
  end

  test "rectangle w/ 1 value" do
    rectangle = rectangle('margin: 10px;')
    assert_equal '10px', rectangle.top.to_s
    assert_equal '10px', rectangle.bottom.to_s
    assert_equal '10px', rectangle.right.to_s
    assert_equal '10px', rectangle.left.to_s
  end

  test "rectangle w/ 2 values" do
    rectangle = rectangle('margin: 10px 0;')
    assert_equal '10px', rectangle.top.to_s
    assert_equal '10px', rectangle.bottom.to_s
    assert_equal '0', rectangle.right.to_s
    assert_equal '0', rectangle.left.to_s
  end

  test "rectangle w/ 3 values" do
    rectangle = rectangle('margin: 10px 5% 0;')
    assert_equal '10px', rectangle.top.to_s
    assert_equal '0', rectangle.bottom.to_s
    assert_equal '5%', rectangle.right.to_s
    assert_equal '5%', rectangle.left.to_s
  end

  test "rectangle w/ 4 values" do
    rectangle = rectangle('margin: 1px 2px 3px 4px;')
    assert_equal '1px', rectangle.top.to_s
    assert_equal '2px', rectangle.right.to_s
    assert_equal '3px', rectangle.bottom.to_s
    assert_equal '4px', rectangle.left.to_s
  end
end