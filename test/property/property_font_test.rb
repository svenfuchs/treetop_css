require File.expand_path('../../test_helper', __FILE__)

class PropertyFontTest < Test::Unit::TestCase
  def property(string)
    Css::Ruleset.new('h1', string).properties.first
  end
  
  test "font-family property" do
    assert_equal 'Helvetica', property('font-family: Helvetica;').value
  end
  
  test "font-family property quoted value" do
    assert_equal '"Helvetica"', property('font-family: "Helvetica";').value
  end
  
  test "font shorthand family" do
    assert_equal 'Helvetica',    property('font: Helvetica;').value
    assert_equal '"Helvetica"',  property('font: "Helvetica";').value
    assert_equal '"Helvetica", sans-serif',  property('font: "Helvetica", sans-serif;').value
  end
  
  test "font shorthand size" do
    assert_equal 'normal', property('font: normal;').value
    assert_equal '14px',   property('font: 14px;').value
    # assert_equal '14px/14px',     property('font: 14px/14px;').value
    # assert_equal 'normal/normal', property('font: normal/normal;').value
    # assert_equal '14px/normal',   property('font: 14px/normal;').value
    # assert_equal 'normal/14px',   property('font: normal/14px;').value
  end
  
  test "font shorthand weight" do
    assert_equal 'bold', property('font: bold;').value
    assert_equal '900',  property('font: 900;').value
  end
  
  test "font shorthand style" do
    assert_equal 'normal', property('font: normal;').value
    assert_equal 'italic', property('font: italic;').value
  end
  
  test "font shorthand combination" do
    assert_equal '300 italic medium/14px "Helvetica", sans-serif', property('font: 300 italic medium/14px "Helvetica", sans-serif;').value
  end
end