require File.expand_path('../test_helper', __FILE__)

class StylesheetTest < Test::Unit::TestCase
  PARSER = StylesheetParser
  
  test "parses a single ruleset" do
    assert_parses ' h1 { font-size: 10pt; } '
  end
  
  test "returns rulesets" do
    assert Css::Stylesheet.parse('h1 { font-size: 10pt; }').rulesets[0].respond_to?(:selectors)
  end
  
  test "parses an empty single ruleset" do
    assert_parses 'h1 { }'
  end
  
  test "parses a single wicked ruleset" do
    assert_parses <<-css
      h1#foo:nth-child(1) > :visited * * p.bar ~ span, p, span { 
        font-size: 10pt; /* some comment */
        -moz-border-radius-topright: 2px !important;
        background: #efd url(/images/foo.gif) no-repeat left top;
      }
    css
  end
  
  test "parses multiple rulesets" do
    assert_parses <<-css
      h1 {
        font-size: 10pt;
      }
      span { 
        font-size: 10pt;
        font-size: 10pt;
      }
    css
  end
  
  test "parses a media ruleset" do
    assert_parses <<-css
      @media all {
        a img { color: inherit; }
        a[href]:hover { background: #ffa }
      }
    css
  end
  
  test "parses a wicked media ruleset" do
    assert_parses '@media all and (-webkit-min-device-pixel-ratio: 0) { #pmLoTemp, #pmHiTemp {letter-spacing: -1px;} }'
  end

  # Dir[File.expand_path(File.expand_path('../fixtures/*.css', __FILE__))].each do |file|
  #   test "parses #{File.basename(file)}" do
  #     assert_parses open(file) { |f| f.read }
  #   end
  # end
end