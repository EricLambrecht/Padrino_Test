class Auswahl
  
  include DataMapper::Resource
  
  property :id, Serial
  
  property :reihenfolge, Integer
  property :sortierung, Integer
  property :kategorie, Integer
  property :seite, Integer
  property :ansicht, Integer
  
end