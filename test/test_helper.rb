$: << File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'test/unit'
require 'treetop_css'

module TestDeclarative
  def self.included(base)
    base.class_eval do
      def self.test(name, *args, &block)
        test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
        defined = instance_method(test_name) rescue false
        raise "#{test_name} is already defined in #{self}" if defined
        if block_given?
          define_method(test_name, &block)
        else
          define_method(test_name) do
            flunk "No implementation provided for #{name}"
          end
        end
      end
    end
  end
end

class Test::Unit::TestCase
  include TestDeclarative

  def assert_parses(*strings)
    strings.each do |string| 
      css = self.class::PARSER.new.parse(string)
      assert(css, "could not parse #{truncate(string).inspect}")
      assert_equal(string, css.text_value)
    end
  end
  
  def truncate(string)
    string[0..99]
  end
end
