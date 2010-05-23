require File.expand_path('../test_helper', __FILE__)

class RulesetTest < Test::Unit::TestCase
  test "selectors" do
    ruleset = Css::Ruleset.new('h1', 'width: 10px !important;')
    assert_equal 'h1', ruleset.selectors
  end

  test "declaration" do
    ruleset = Css::Ruleset.new('h1', 'width: 10px !important;')
    assert_equal 'width: 10px !important;', ruleset.declaration
  end

  test "properties" do
    property = Css::Ruleset.new('h1', 'width: 10px !important;').properties.first
    assert_equal 'width: 10px !important;', property.text_value
  end
end