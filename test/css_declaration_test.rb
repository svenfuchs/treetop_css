require File.expand_path('../test_helper', __FILE__)

class CssDeclarationParserTest < Test::Unit::TestCase
  PARSER = CSSDeclarationParser
  
  test "declaration" do
    assert_parses 'font-size: 10pt'
    assert_parses 'font-size: 10pt;'
    assert_parses '-moz-border-radius-topright: 2px !important;'
    assert_parses 'background: #efd url(/images/foo.gif) no-repeat left top;'
    assert_parses '*display:inline'
    assert_parses 'background-position:;'
    assert_parses 'font-family: "lucida grande", helvetica, sans-serif;'
    assert_parses 'opacity:.8;'
    assert_parses 'filter:Alpha(Opacity=80);'
    assert_parses '-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";'
    assert_parses "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='img/3.0/video/416_player.png');"
    assert_parses 'padding:15px 20px 17px 20px;;'
    assert_parses 'padding:15px 20px 17px 20px; ;'
    # assert_parses "content: 'Â»';"
  end
end