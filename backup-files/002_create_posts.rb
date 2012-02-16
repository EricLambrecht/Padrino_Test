migration 2, :create_posts do
  up do
    create_table :posts do
      column :id, Integer, :serial => true
      column :titel, String, :length => 255
      column :body, Text
      column :wertung, Float
      column :design, Float
      column :hersteller, String
      column :kakaogehalt, String
      column :anbaugebiet, String
      
      column :bild, FilePath, :required => true 
      
      column :fett, Float
      column :kohlenhydrate, Float
      column :zucker, Float
      column :zutaten, String
      
      column :woher, String 
      column :gewicht, Float
      column :preis, Float
      
      column :datum, DateTime
      column :oeffentlich, Boolean, :default => false
      column :kurztitel, String, :length => 40
    end
  end

  down do
    drop_table :posts
  end
end
