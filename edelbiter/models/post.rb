class Post
  include DataMapper::Resource
  
  # Booleans muessen true/false sein.
  DataMapper::Property::Boolean.allow_nil(false) 

  # property <name>, <type>
  property :id, Serial
  property :titel, String
  property :body, Text
  property :wertung, Float
  property :design, Float
  property :hersteller, String
  property :kakaogehalt, String
  property :anbaugebiet, String
  
  property :bild, String
  
  property :fett, Float
  property :kohlenhydrate, Float
  property :zucker, Float
  property :zutaten, String
  
  property :woher, String 
  property :gewicht, Float
  property :preis, Float
  
  property :datum, DateTime
  property :oeffentlich, Boolean
  property :kurztitel, String
end
