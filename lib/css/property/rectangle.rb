module Css
  module Property
    module Rectangle
      def top
        expanded_values[0]
      end
    
      def right
        expanded_values[1]
      end
    
      def bottom
        expanded_values[2]
      end
    
      def left
        expanded_values[3]
      end
    
      def values
        @values ||= property_value.elements.map do |element| 
          element.text_value unless element.text_value.strip.empty?
        end.compact
      end
    
      def expanded_values
        case values.size
        when 1
          values * 4
        when 2
          values * 2
        when 3
          values + [values[1]]
        when 4
          values
        end
      end
    end
  end
end