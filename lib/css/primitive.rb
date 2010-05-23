module Css
  class Primitive < Treetop::Runtime::SyntaxNode
    NUMBER_TYPES = [:signed_number, :positive_number, :number, :integer, :positive_float, :float]
    UNIT_TYPES   = [:length_unit, :angle_unit, :time_unit, :frequency_unit, :percent]
    
    def type
      case true
      when respond_to?(:url)
        :reference
      # when respond_to?(:color)
      #   :color
      when respond_to?(:length_unit)
        :length
      when respond_to?(:percent)
        :percentage
      when respond_to?(:angle_unit)
        :angle
      when respond_to?(:time_unit)
        :time
      when respond_to?(:frequency_unit)
        :frequency
      end
    end

    def value
      case type
      when :length, :percentage, :angle, :time, :frequency, :float
        number
      end
    end

    def unit
      case type
      when :length, :percentage, :angle, :time, :frequency
        number
      end
    end
    
    def to_s
      @string ||= [value, unit].compact.join
    end

    def number_type
      @number_type ||= NUMBER_TYPES.detect { |type| respond_to?(type) }
    end
    
    def number?
      !!number_type
    end

    def number
      @number ||= send(number_type).value if number?
    end

    def unit_type
      @unit_type ||= UNIT_TYPES.detect { |type| respond_to?(type) }
    end
    
    def unit?
      !!unit_type
    end

    def unit
      @unit ||= send(unit_type).text_value if unit?
    end
  end
end