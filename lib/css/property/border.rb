module Css
  module Property
    module Border
      include Property

      def expand_properties
        [:color, :style, :width].inject({}) do |result, name|
          expand_property(result, 'border', name, send(name))
        end 
      end

      def color
        @color ||= find_node(:color)
      end

      def style
        @style ||= find_node(:border_style)
      end

      def width
        @width ||= find_node(:border_width_value)
      end
    end
  end
end