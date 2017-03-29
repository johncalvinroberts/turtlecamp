class AddFieldsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :name, :string, null: false
    add_column :students, :current_school, :string
    add_column :students, :satm, :integer
    add_column :students, :satv, :integer
    add_column :students, :satwr, :integer
    add_column :students, :act, :integer
    add_column :students, :toeflr, :integer
    add_column :students, :toeflwr, :integer
    add_column :students, :toefls, :integer
    add_column :students, :toefll, :integer
    add_reference :students, :counselor, index: true, foreign_key: true
  end
end
