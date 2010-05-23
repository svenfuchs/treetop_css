require File.expand_path('../../test_helper', __FILE__)

class PropertyBorderTest < Test::Unit::TestCase
  def property(string)
    Css::Ruleset.new('h1', string).properties.first
  end

  ['1px', '1px 2px', '1px 2px 3px', '1px 2px 3px 4px'].each do |width|
    test "border-width #{width}" do
      assert_equal width, property("border-width: #{width};").value
    end
  end
  
  test "border-top-width" do
    assert_equal '10px', property("border-top-width: 10px;").value
  end
  
  test "border-color" do
    assert_equal '#333', property("border-top-width: #333;").value
  end
  
  test "border-top-color" do
    assert_equal '#333', property("border-top-width: #333;").value
  end
  
  test "border-style" do
    assert_equal 'dotted', property("border-top-width: dotted;").value
  end
  
  test "border-top-style" do
    assert_equal 'dotted', property("border-top-width: dotted;").value
  end
  
  test "border-top" do
    assert_equal '1px solid red', property("border-top: 1px solid red;").value
  end
  
  test "border" do
    assert_equal '1px solid red', property("border: 1px solid red;").value
  end
  
  test "expand border properties" do
    properties = property('border: 1px solid red;').expand_properties

    assert_equal 'solid', properties[:borderStyle].value
    assert_equal '1px', properties[:borderWidth].value
    assert_equal 'red', properties[:borderColor].value
  end
end