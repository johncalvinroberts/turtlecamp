class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :current_school, :string
    add_column :users, :satm, :integer
    add_column :users, :satv, :integer
    add_column :users, :satwr, :integer
    add_column :users, :act, :integer
    add_column :users, :toeflr, :integer
    add_column :users, :toeflwr, :integer
    add_column :users, :toefls, :integer
    add_column :users, :toefll, :integer
    add_column :users, :is_counselor, :boolean, default: true, null: false
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :counselor_ref, :integer
  end
end

