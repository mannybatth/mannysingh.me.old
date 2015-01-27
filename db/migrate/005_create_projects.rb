migration 5, :create_projects do
  up do
    create_table :projects do
      column :id, Integer, :serial => true, :allow_nil => false
      column :title, DataMapper::Property::String, :length => 255
      column :body, DataMapper::Property::Text
      column :screenshots, DataMapper::Property::String, :length => 255
      column :created_at, DataMapper::Property::DateTime
      column :updated_at, DataMapper::Property::DateTime
    end
  end

  down do
    drop_table :projects
  end
end
