# Helper methods defined here can be accessed in any controller or view in the application

Edelbiter.helpers do
  
  # Erkennt links in einem String  // Oeffnet Jetzt links in einem neuen Fenster, falls das irgendwo nicht erwuenscht sein sollte, muss ein neuer helper erstellt werden...
  
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
  
  
  # Macht aus der float wertung eine Zahl mit einem oder zwei Dritteln. Fixed.
  
  def drittel( wertung )
    rest = sprintf("%.1f",(wertung.to_f % 1))
    if rest.to_f == 0.3
      return (wertung - (wertung%1)).to_i.to_s + '<div class="unsichtbar"> .3 </div>&#8531;'
    elsif rest.to_f == 0.6
      return (wertung - (wertung%1)).to_i.to_s + '<div class="unsichtbar"> .6 </div>&#8532;'
    elsif rest.to_f == 0
      return wertung.to_i.to_s
    else
      return sprintf("%.1f",wertung.to_s).sub(".",",")
    end
  end
  
  # Macht aus der float wertung eine Zahl mit einem oder zwei Dritteln. Funktioniert.
  
  def drittelworte( wertung )
    if wertung < 1
      string1 = ''
    elsif wertung < 2
      string1 = 'eins'
    elsif wertung < 3
      string1 = 'zwei'
    elsif wertung < 4
      string1 = 'drei'
    elsif wertung < 5
      string1 = 'vier'
    elsif wertung < 6
      string1 = 'f&uuml;nf'
    elsif wertung < 7
      string1 = 'secht'
    elsif wertung < 8
      string1 = 'sieben'
    elsif wertung < 9
      string1 = 'acht'
    elsif wertung < 10
      string1 = 'neun'
    elsif wertung < 11
      string1 = 'zehn'
    elsif wertung < 12
      string1 = 'elf'
    else
      string1 = 'zw&ouml;f'
    end
    rest = sprintf("%.1f",(wertung.to_f % 1))
    if rest.to_f == 0.3
      return string1 + " ein drittel"
    elsif rest.to_f == 0.6
      return string1 + " zwei drittel"
    elsif rest.to_f == 0
      return string1
    else
      return sprintf("%.1f",wertung.to_s).sub(".",",")
    end
  end

  # Die Wertung kann in Worten Dargestellt werden...

  def wertungWorte (wertung)
    if wertung < 1
      return 'unglaublich schlecht'
    elsif wertung < 2
      return 'wirklich schlecht'
    elsif wertung < 3
      return 'relativ schlecht'
    elsif wertung < 4
      return 'in ordnung'
    elsif wertung < 5
      return 'relativ gut'
    elsif wertung < 6
      return 'wirklich gut'
    elsif wertung < 7
      return 'sehr gut'
    elsif wertung < 8
      return 'hervorragend'
    elsif wertung < 9
      return 'unbeschreiblich gut'
    elsif wertung < 10
      return 'bet&ouml;rend gut'
    elsif wertung < 11
      return 'unwirklich gut'
    else
      return 'katastrophal gut'
    end
  end

# Macht einen String URL Kompatibel

  def do_url (name)
    name.to_s.downcase.gsub(' ', '_')
  end
  
end