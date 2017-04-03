class AddCategoryToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :category, :string, default: "Uncategorized"
  end
end
