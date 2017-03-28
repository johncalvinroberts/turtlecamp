class AddFieldsToCounselorModel < ActiveRecord::Migration[5.0]
  def change
    add_column :counselors, :name, :string, null: false
    add_column :counselors, :wechat_id, :string
  end
end
