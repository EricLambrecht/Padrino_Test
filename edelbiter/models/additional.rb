class Additional
  include DataMapper::Resource

  # property <name>, <type>
  property :id,             Serial
  
  # Adresse (imperessum)
  property :impname,        String
  property :impstr,         String
  property :impstadt,       String
  property :impland,        String

  # Weitere Sachen
  property :copyright,      String
  property :logopic,        String
  property :logountertitel, String


  # Text Vorschlag seite
  property :vorschlag,      Text


end
