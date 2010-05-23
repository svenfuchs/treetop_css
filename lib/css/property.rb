module Css
  module Property
    autoload :Background, 'css/property/background'
    autoload :Border,     'css/property/border'
    autoload :Font,       'css/property/font'
    autoload :Rectangle,  'css/property/rectangle'

    def name
      property_name.text_value
    end

    def priority
      property_priority.text_value
    end
    
    def value
      property_value.text_value
    end

    def value_nodes
      @value_nodes ||= property_value.elements.reject { |element| element.text_value.empty? }
    end

    def numeric_value
      property_value.number if property_value.number?
    end

    def unit
      property_value.unit
    end
    
    protected

      def find_node(method)
        value_nodes.detect { |node| parser_methods(node).include?(method) }
      end

      def parser_methods(node)
        modules = node.extension_modules
        node.methods - [modules.last ? modules.last.methods : nil] - node.class.instance_methods
      end
      
      def expand_property(result, type, name, value)
        result[:"#{type}#{name[0].upcase}#{name[1..-1]}"] = parse_property(type, name, value) if value
        result
      end
      
      def parse_property(type, name, value)
        value = Array(value).compact.map { |value| value.text_value.strip }.join(' ')
        PropertiesParser.new.parse("#{type}-#{name}: #{value}").elements.first
      end
  end
end