require File.expand_path('../test_helper', __FILE__)

class CssPrimitivesParserTest < Test::Unit::TestCase
  PARSER = PrimitivesParser
  
  def primitive(string)
    PrimitivesParser.new.parse(string)
  end

  test "primitive formatting :float" do
    assert_equal '0.55', primitive('0.55').to_s
  end

  test "primitive type :url" do
    assert_equal :reference, primitive('url(http://google.com)').type
  end
  
  # PERCENTAGE

  test "primitive type :percentage" do
    assert_equal :percentage, primitive('2%').type
  end

  test "primitive value :percentage (integer)" do
    assert_equal 2, primitive('2%').value
  end

  test "primitive value :percentage (float)" do
    assert_equal 2.0, primitive('2.0%').value
  end

  test "primitive unit % :percentage" do
    assert_equal '%', primitive('2%').unit
  end

  %w(0% 10% -10% 100% 0.1% -0.1%).each do |value|
    test "primitive #{value} to_s :percentage" do
      assert_equal value, primitive(value).to_s
    end
  end

  test "primitive +10% to_s :percentage" do
    assert_equal '10%', primitive('+10%').to_s
  end

  test "primitive +0.1% to_s :percentage" do
    assert_equal '0.1%', primitive('+0.1%').to_s
  end
  
  # LENGTH

  test "primitive type :length" do
    assert_equal :length, primitive('2px').type
  end

  test "primitive value :length (integer)" do
    assert_equal 2, primitive('2px').value
  end

  test "primitive value :length (float)" do
    assert_equal 2.0, primitive('2.0pt').value
  end

  test "primitive unit em :length" do
    assert_equal 'em', primitive('2em').unit
  end
  
  test "primitive unit ex :length" do
    assert_equal 'ex', primitive('2ex').unit
  end
  
  test "primitive unit px :length" do
    assert_equal 'px', primitive('2px').unit
  end
  
  test "primitive unit in :length" do
    assert_equal 'in', primitive('2in').unit
  end
  
  test "primitive unit cm :length" do
    assert_equal 'cm', primitive('2cm').unit
  end
  
  test "primitive unit mm :length" do
    assert_equal 'mm', primitive('2mm').unit
  end
  
  test "primitive unit pt :length" do
    assert_equal 'pt', primitive('2pt').unit
  end
  
  test "primitive unit pc :length" do
    assert_equal 'pc', primitive('2pc').unit
  end
  
  # ANGLE

  test "primitive type :angle" do
    assert_equal :angle, primitive('2deg').type
  end

  test "primitive value :angle (integer)" do
    assert_equal 2, primitive('2deg').value
  end

  test "primitive value :angle (float)" do
    assert_equal 2.0, primitive('2.0deg').value
  end
  
  test "primitive unit deg :angle" do
    assert_equal 'deg', primitive('2deg').unit
  end
  
  test "primitive unit grad :angle" do
    assert_equal 'grad', primitive('2grad').unit
  end
  
  test "primitive unit rad :angle" do
    assert_equal 'rad', primitive('2rad').unit
  end
  
  # FREQUENCY

  test "primitive type :frequency" do
    assert_equal :frequency, primitive('2kHz').type
  end

  test "primitive value :frequency (integer)" do
    assert_equal 2, primitive('2kHz').value
  end

  test "primitive value :frequency (float)" do
    assert_equal 2.0, primitive('2.0kHz').value
  end
  
  test "primitive unit Hz :frequency" do
    assert_equal 'Hz', primitive('2Hz').unit
  end
  
  test "primitive unit kHz :frequency" do
    assert_equal 'kHz', primitive('2kHz').unit
  end
  
  # TIME
  
  test "primitive type :time" do
    assert_equal :time, primitive('2s').type
  end

  test "primitive value :time (integer)" do
    assert_equal 2, primitive('2s').value
  end

  test "primitive value :time (float)" do
    assert_equal 2.0, primitive('2.0s').value
  end
  
  test "primitive unit s :time" do
    assert_equal 's', primitive('2s').unit
  end
  
  test "primitive unit ms :time" do
    assert_equal 'ms', primitive('2ms').unit
  end
  
  # PARSING

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
    assert_parses *%w(0% 10% -10% 100% 0.1% -0.1%)
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