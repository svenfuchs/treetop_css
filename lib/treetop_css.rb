require "rubygems"
require "treetop"
require File.dirname(__FILE__) + "/css/css_pre_parser"

Treetop.load File.dirname(__FILE__) + "/css/url"
Treetop.load File.dirname(__FILE__) + "/css/css_color"
Treetop.load File.dirname(__FILE__) + "/css/css_primitives"
Treetop.load File.dirname(__FILE__) + "/css/css_expression"
Treetop.load File.dirname(__FILE__) + "/css/css_declaration"
Treetop.load File.dirname(__FILE__) + "/css/css_selector"
Treetop.load File.dirname(__FILE__) + "/css/css"

CSSParser.send(:include, CSSPreparser)