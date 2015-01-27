migration 8, :create_platform_projects do
  up do
    create_table :platform_projects do
      column :project_id, Integer, :key => true, :allow_nil => false
      column :platform_id, Integer, :key => true, :allow_nil => false
    end
  end

  down do
    drop_table :platform_projects
  end
end
