require "rubygems"
require "treetop"
require File.dirname(__FILE__) + "/css/parser/pre_parser"

Treetop.load File.dirname(__FILE__) + "/css/parser/colors"
Treetop.load File.dirname(__FILE__) + "/css/parser/symbols"
Treetop.load File.dirname(__FILE__) + "/css/parser/units"
Treetop.load File.dirname(__FILE__) + "/css/parser/url"
Treetop.load File.dirname(__FILE__) + "/css/parser/primitives"
Treetop.load File.dirname(__FILE__) + "/css/parser/property/border.treetop"
Treetop.load File.dirname(__FILE__) + "/css/parser/property/background.treetop"
Treetop.load File.dirname(__FILE__) + "/css/parser/property/rectangle.treetop"
Treetop.load File.dirname(__FILE__) + "/css/parser/property/font.treetop"
Treetop.load File.dirname(__FILE__) + "/css/parser/properties"
Treetop.load File.dirname(__FILE__) + "/css/parser/selector"
Treetop.load File.dirname(__FILE__) + "/css/parser/stylesheet"

StylesheetParser.send(:include, Css::Parser::PreParser)

module Css
  autoload :Color,      'css/color'
  autoload :Number,     'css/number'
  autoload :Primitive,  'css/primitive'
  autoload :Property,   'css/property'
  autoload :Ruleset,    'css/ruleset'
  autoload :Stylesheet, 'css/stylesheet'
  autoload :Uri,        'css/uri'
end