module Css
  module Parser
    module PreParser
      def parse(string)
        replace_comments(string)
        super
      end
  
      private
  
        def replace_comments(string)
          string.gsub!(/\/\*.*?\*\//m, '')
        end
    end
  end
end