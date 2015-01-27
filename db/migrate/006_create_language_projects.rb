migration 6, :create_language_projects do
  up do
    create_table :language_projects do
      column :project_id, Integer, :key => true, :allow_nil => false
      column :language_id, Integer, :key => true, :allow_nil => false
    end
  end

  down do
    drop_table :language_projects
  end
end
