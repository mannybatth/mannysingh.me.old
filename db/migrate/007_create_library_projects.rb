migration 7, :create_library_projects do
  up do
    create_table :library_projects do
      column :project_id, Integer, :key => true, :allow_nil => false
      column :library_id, Integer, :key => true, :allow_nil => false
    end
  end

  down do
    drop_table :library_projects
  end
end
