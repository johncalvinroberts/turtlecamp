class RemoveNameFromCollegeApp < ActiveRecord::Migration[5.0]
  def change
    remove_column :college_apps, :name
  end
end
