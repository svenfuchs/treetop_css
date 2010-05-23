require File.expand_path('../../test_helper', __FILE__)

class PropertyBackgroundTest < Test::Unit::TestCase
  def property(string)
    Css::Ruleset.new('h1', string).properties.first
  end
  
  test "background-position" do
    assert_equal '2px',  property('background-position: 2px;').value
    assert_equal 'top',  property('background-position: top;').value
    assert_equal '2px -2%',  property('background-position: 2px -2%;').value
    assert_equal 'top left', property('background-position: top left;').value
    assert_equal 'left top', property('background-position: left top;').value
  end
  
  test "background-color" do
    assert_equal '#ccc',  property('background-color: #ccc;').value
  end
  
  test "background-image" do
    assert_equal 'url("http://example.org/logo.gif")',  property('background-image: url("http://example.org/logo.gif");').value
  end
  
  test "background-repeat" do
    assert_equal 'no-repeat',  property('background-repeat: no-repeat;').value
    assert_equal 'repeat-x',   property('background-repeat: repeat-x;').value
    assert_equal 'repeat-y',   property('background-repeat: repeat-y;').value
    assert_equal 'repeat',     property('background-repeat: repeat;').value
  end
  
  test "background-attachment" do
    assert_equal 'fixed',  property('background-attachment: fixed;').value
  end
  
  backgrounds = [ '2px', 'no-repeat', '#ccc', 'url("http://example.org/logo.gif")',
                  'transparent url("http://example.org/logo.gif") no-repeat top bottom' ]
  backgrounds.each do |background|
    test "background #{background}" do
      assert_equal background,  property("background: #{background};").value
    end
  end
  
  test "expand background properties" do
    background = property('background: transparent url("http://example.org/logo.gif") no-repeat top left scroll')
    properties = background.expand_properties
    assert_equal 'url("http://example.org/logo.gif")', properties[:backgroundImage].value
    assert_equal 'transparent', properties[:backgroundColor].value
    assert_equal 'no-repeat',   properties[:backgroundRepeat].value
    assert_equal 'top left',    properties[:backgroundPosition].value
    assert_equal 'scroll',      properties[:backgroundAttachment].value
  end
end