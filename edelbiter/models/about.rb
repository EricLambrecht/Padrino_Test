class About
  include DataMapper::Resource

  # property <name>, <type>
  property :id,             Serial
  property :title,          String
  property :body,           Text
  property :pic,            String
  property :oeffentlich,    Boolean
end
