class AddStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :status, :string, default: "not done"
  end
end
