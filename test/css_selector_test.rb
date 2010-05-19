require File.expand_path('../test_helper', __FILE__)

class CssSelectorParserTest < Test::Unit::TestCase
  PARSER = CSSSelectorParser
  
  test "selector" do
    assert_parses *%w(
      h1 h1#Foo h1.bar h1#foo.bar:nth-child(1)
      #foo #foo.bar #foo.bar:visited 
      .foo .foo:visited
      :visited a:visited
      :nth-child(1) :nth-child(odd) :nth-child(-n+3) :nth-child(2n+1)
    )
    assert_parses '.mi *'
    assert_parses 'h1#foo:nth-child(1) > :visited * * p.bar ~ span'
  end
end