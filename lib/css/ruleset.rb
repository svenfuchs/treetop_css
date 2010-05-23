module Css
  class Ruleset
    attr_reader :selectors, :declaration

    def initialize(selectors, declaration)
      @selectors = selectors
      @declaration = declaration
    end

    def properties
      @properties ||= PropertiesParser.new.parse(declaration).elements
    end
  end
end