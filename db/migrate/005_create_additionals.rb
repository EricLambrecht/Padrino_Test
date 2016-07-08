migration 5, :create_additionals do
  up do
    create_table :additionals do

      column :id,               Integer, :serial => true
      column :impressum,        Text
      column :copyright,        String, :length => 255
      column :logountertitel,   String, :length => 255
      column :vorschlag,        Text
    end
  end

  down do
    drop_table :additionals
  end
end