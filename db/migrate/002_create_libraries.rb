migration 2, :create_libraries do
  up do
    create_table :libraries do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
      column :link, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :libraries
  end
end
