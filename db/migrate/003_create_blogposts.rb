migration 3, :create_blogposts do
  up do
    create_table :blogposts do
      column :id,          Integer,  :serial => true
      column :titel,       String,   :length => 255
      column :body,        Text
      column :kategorie,   String,   :length => 255
      column :oeffentlich, Boolean
      column :spotlight,   Boolean
      column :datum,       DateTime,  required => true
      column :tweettext,   String
    end
  end

  down do
    drop_table :blogposts
  end
end
