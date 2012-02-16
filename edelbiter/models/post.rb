class Post
  include DataMapper::Resource
  include DataMapper::Validate
  
  # Booleans muessen true/false sein.
  DataMapper::Property::Boolean.allow_nil(false) 

# property <name>,            <type>
  property :id,               Serial
  property :titel,            String, :required => true
  property :body,             Text, :required => true
  property :wertung,          Float
  property :design,           Float
  property :hersteller,       String
  property :kakaogehalt,      String
  property :anbaugebiet,      String
  
  property :bild,             String, :required => true
  
  property :fett,             Float
  property :kohlenhydrate,    Float
  property :zucker,           Float
  property :zutaten,          String
  
  property :woher,            String 
  property :gewicht,          Float, :default => 100
  property :preis,            Float
  
  property :datum,            DateTime, :required => true
  property :oeffentlich,      Boolean
  property :kurztitel,        String, :required => true
end
