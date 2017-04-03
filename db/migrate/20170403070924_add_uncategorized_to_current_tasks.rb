class AddUncategorizedToCurrentTasks < ActiveRecord::Migration[5.0]
  def change
    Task.where(category: nil).update_all(category: "Uncategorized")
  end
end
