module Css
  class Number < Treetop::Runtime::SyntaxNode
    def value
      @value ||= eval(text_value.gsub(/[^\d.+-]/, ''))
    end
    
    def to_s
      value.to_s
    end
  end
end