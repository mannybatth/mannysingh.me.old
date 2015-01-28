migration 9, :add_order_to_projects do
  up do
    modify_table :projects do
      add_column :list_order, Integer
    end
  end
end