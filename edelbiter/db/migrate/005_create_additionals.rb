migration 5, :create_additionals do
  up do
    create_table :additionals do

      column :id,               Integer, :serial => true

      column :impname,          String, :length => 255
      column :impstr,           String, :length => 255
      column :impstadt,         String, :length => 255
      column :impland,          String, :length => 255
    
      column :copyright,        String, :length => 255
      column :logopic,          String, :length => 255
      column :logountertitel,   String, :length => 255

      column :vorschlag,        String, :length => 255
    end
  end

  down do
    drop_table :additionals
  end
end