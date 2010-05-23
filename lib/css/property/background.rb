module Css
  module Property
    module Background
      include Property

      def expand_properties
        [:color, :image, :repeat, :attachment, :position].inject({}) do |result, name|
          if value = send(name)
            property = expand_property(result, 'background', name, value)
          end
          result
        end 
      end

      def color
        @color ||= find_node(:color)
      end

      def image
        @image ||=find_node(:uri)
      end

      def repeat
        @repeat ||= find_node(:background_repeat)
      end

      def attachment
        @attachment ||=find_node(:background_attachment)
      end
      
      def position
        @position ||= [vertical_position, horizontal_position].compact
      end

      def vertical_position
        find_node(:background_vertical_position)
      end

      def horizontal_position
        find_node(:background_horizontal_position)
      end
    end
  end
end