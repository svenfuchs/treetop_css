module CSSPreparser
  def parse(string)
    replace_comments(string)
    super
  end
  
  private
  
    def replace_comments(string)
      string.gsub!(/\/\*.*?\*\//m, '')
    end
end
