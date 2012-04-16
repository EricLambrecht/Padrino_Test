migration 4, :create_abouts do
  up do
    create_table :abouts do
      column :id, Integer, :serial => true
      column :title, String, :length => 255
      column :body, Text
      column :oeffentlich, Boolean
    end
  end

  down do
    drop_table :abouts
  end
end
