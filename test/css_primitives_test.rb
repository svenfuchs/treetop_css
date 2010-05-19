require File.expand_path('../test_helper', __FILE__)

class CssPrimitivesParserTest < Test::Unit::TestCase
  PARSER = CSSPrimitivesParser

  test "3-digit hex color" do
    assert_parses '#333'
  end

  test "6-digit hex color" do
    assert_parses '#333333'
  end

  test "rgb color" do
    assert_parses 'rgb( 2, 0, 0 )', 'rgb(2, 0, 0)', 'rgb(2,0,0)'
  end

  test "rgb color percentage" do
    assert_parses 'rgb(10%, 20%, 100%)'
  end
  
  test "named colors" do
    assert_parses *%w(aqua black blue fuchsia gray green lime maroon navy olive purple red silver teal white yellow)
  end
  
  test "lengths" do
    assert_parses *%w(0.5em 1em -1em 1ex 1px -134.4px 0.5in 2cm 4mm 12pt 1pc)
  end
  
  test "degrees" do
    assert_parses *%w(10deg 10grad 10rad -10deg 1234.45deg +10deg)
  end
  
  test "times" do
    assert_parses *%w(10ms 10s 11.2s)
  end
  
  test "frequencies" do
    assert_parses *%w(10Hz 10kHz +10Hz 11.2Hz)
  end
  
  test "percentages" do
    assert_parses *%w(0% 10% -10% 100%)
  end
  
  test "urls" do
    assert_parses *%w(
      url('http://google.com')
      url("http://google.com")
      url(http://google.com)
      url(http://google.com/foo/bar/baz)
      url(/foo/bar.gif)
      url(http://localhost:3000)
      url(http://localhost:3000/foo?bar=quxx&foo=bar&one=two)
      url(http://www.w3.org)
    )
    # /StyleSheets/TR/logo-CR
  end
end