class AddEmblemToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :emblem, :string
  end
end