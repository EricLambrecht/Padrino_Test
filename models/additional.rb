class Additional
  include DataMapper::Resource

  # property <name>, <type>
  property :id,             Serial
  
  # Imperessum
  property :impressum,      Text

  # Weitere Sachen
  property :copyright,      String
  property :logountertitel, String

  # Text Vorschlag seite
  property :vorschlag,      Text


end
