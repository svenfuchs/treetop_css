module Css
  class Stylesheet < Treetop::Runtime::SyntaxNode
    class << self
      def parse(css)
        StylesheetParser.new.parse(css)
      end
    end
    
    def rulesets
      elements.map do |element| 
        Ruleset.new(element.selectors, element.declaration) if element.respond_to?(:declaration)
      end
    end
  end
end