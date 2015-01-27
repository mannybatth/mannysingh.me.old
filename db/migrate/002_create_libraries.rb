migration 2, :create_libraries do
  up do
    create_table :libraries do
      column :id, Integer, :serial => true, :allow_nil => false
      column :name, DataMapper::Property::String, :length => 255
      column :link, DataMapper::Property::String, :length => 255
      column :created_at, DataMapper::Property::DateTime
      column :updated_at, DataMapper::Property::DateTime
    end
  end

  down do
    drop_table :libraries
  end
end
