class AddDeadlineToAllApps < ActiveRecord::Migration[5.0]
  def change
    CollegeApp.where(deadline: nil).update_all(deadline: Time.now+80.days)
    change_column :college_apps, :deadline, :datetime, null: false
  end
end
