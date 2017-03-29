class AddCollegeRefToCollegeApp < ActiveRecord::Migration[5.0]
  def change
    add_column :college_apps, :college_id, :integer
  end
end
