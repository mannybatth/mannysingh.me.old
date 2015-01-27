migration 3, :create_languages do
  up do
    create_table :languages do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
      column :link, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :languages
  end
end
