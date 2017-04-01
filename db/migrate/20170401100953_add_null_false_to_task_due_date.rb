class AddNullFalseToTaskDueDate < ActiveRecord::Migration[5.0]
  def change
    Task.where(due_date: nil).update_all(due_date: Time.now+7.days)
    change_column :tasks, :due_date, :datetime, null: false
  end
end
