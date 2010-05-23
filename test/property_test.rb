require File.expand_path('../test_helper', __FILE__)

class PropertyTest < Test::Unit::TestCase
  PARSER = PropertiesParser
  
  def property(string)
    Css::Ruleset.new('h1', string).properties.first
  end
  
  test "parses individual declarations" do
    assert_parses 'font-size: 10pt'
    assert_parses 'font-size: 10pt;'
    assert_parses '-moz-border-radius-topright: 2px !important;'
    assert_parses 'background: #efd top;'
    assert_parses 'background: #efd url(/images/foo.gif) no-repeat left top;'
    assert_parses '*display:inline'
    # assert_parses 'background-position:;'
    assert_parses 'font-family: "lucida grande", helvetica, sans-serif;'
    # assert_parses 'opacity:.8;'
    assert_parses 'filter:Alpha(Opacity=80);'
    assert_parses '-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";'
    assert_parses "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='img/3.0/video/416_player.png');"
    assert_parses 'padding:15px 20px 17px 20px;;'
    assert_parses 'padding:15px 20px 17px 20px; ;'
    assert_parses 'font: medium/14px;'
    assert_parses 'font: verdana, helvetica, sans-serif;'
    assert_parses 'font: 300 italic medium/14px verdana, helvetica, sans-serif;'
    # assert_parses "content: 'Â»';"
  end
  
  test "parses multiple declarations" do
    assert_parses 'padding: 15px; font-size: 10pt;'
  end
  
  test "property name" do
    assert_equal 'width', property('width: 10px;').name
  end

  test "property value" do
    assert_equal '10px', property('width: 10px;').value
  end

  test "property numeric_value" do
    assert_equal 10, property('width: 10px;').numeric_value
  end

  test "property unit" do
    assert_equal 'px', property('width: 10px;').unit
  end

  test "property priority" do
    assert_equal '!important', property('width: 10px !important;').priority
  end
end