# encoding: utf-8

$: << File.expand_path('../lib', __FILE__)
require 'treetop_css/version'

Gem::Specification.new do |s|
  s.name         = "treetop_css"
  s.version      = TreetopCss::VERSION
  s.authors      = ["Sven Fuchs"]
  s.email        = "svenfuchs@artweb-design.de"
  s.homepage     = "http://github.com/svenfuchs/treetop_css"
  s.summary      = "Treetop CSS grammar/parser"
  s.description  = "Treetop CSS grammar/parser."

  s.files        = `git ls-files {app,lib}`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
  s.required_rubygems_version = '>= 1.3.6'
end
