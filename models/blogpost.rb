class Blogpost
  include DataMapper::Resource

# property <name>, <type>
  property :id,          Serial
  property :titel,       String
  property :body,        Text
  property :kategorie,   String
  property :oeffentlich, Boolean
  property :spotlight,   Boolean
  property :datum,       DateTime
  property :tweettext,   String
end
