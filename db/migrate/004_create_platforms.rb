migration 4, :create_platforms do
  up do
    create_table :platforms do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
      column :link, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :platforms
  end
end
