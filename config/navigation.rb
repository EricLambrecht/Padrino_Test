SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :schokolade, 'SCHOKOLADE', '/archive', :highlights_on => /\/sort/ 
    primary.item :blog, 'BLOG', '/blog', :highlights_on => /\/blog/ 
    primary.item :about, '&Uuml;BER UNS', '/about'
    primary.item :vorschlag, 'KONTAKT', '/suggest'
  end
end