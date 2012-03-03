# Helper methods defined here can be accessed in any controller or view in the application

Edelbiter.helpers do
  
  # Erkennt links in einem String
  
  def linkify( text )
    
    @generic_URL_regexp = Regexp.new( '(^|[\n ])([\w]+?://[\w]+[^ \"\n\r\t<]*)', Regexp::MULTILINE | Regexp::IGNORECASE )
    @starts_with_www_regexp = Regexp.new( '(^|[\n ])((www)\.[^ \"\t\n\r<]*)', Regexp::MULTILINE | Regexp::IGNORECASE )
    @starts_with_ftp_regexp = Regexp.new( '(^|[\n ])((ftp)\.[^ \"\t\n\r<]*)', Regexp::MULTILINE | Regexp::IGNORECASE )
    @email_regexp = Regexp.new( '(^|[\n ])([a-z0-9&\-_\.]+?)@([\w\-]+\.([\w\-\.]+\.)*[\w]+)', Regexp::IGNORECASE )
    
    s = text.to_s
    s.gsub!( @generic_URL_regexp, '\1<a href="\2" target="_blank">\2</a>' )
    s.gsub!( @starts_with_www_regexp, '\1<a href="http://\2" target="_blank">\2</a>' )
    s.gsub!( @starts_with_ftp_regexp, '\1<a href="ftp://\2" target="_blank">\2</a>' )
    s.gsub!( @email_regexp, '\1<a href="mailto:\2@\3">\2@\3</a>' )
    s
  end
  
  # Macht aus der float wertung eine Zahl mit einem oder zwei Dritteln
  
  def drittel( wertung )
    rest = sprintf("%.1f",(wertung.to_f % 1))
    if rest.to_f == 0.3
      return (wertung - 0.3).to_i.to_s + " &#8531;"
    elsif rest.to_f == 0.6
      return (wertung - 0.6).to_i.to_s + " &#8532;"
    elsif rest.to_f == 0
      return wertung.to_i.to_s
    else
      return sprintf("%.1f",wertung.to_s).sub(".",",")
    end
  end
  
end
