SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :schokolade, 'SCHOKOLADE', '/archive', :highlights_on => /\/sort/ 
    primary.item :blog, 'BLOG', '/blog', :highlights_on => /\/blog/ 
    primary.item :about, 'UEBER UNS', '/about'
    primary.item :vorschlag, 'VORSCHLAG', '/suggest'
  end
end