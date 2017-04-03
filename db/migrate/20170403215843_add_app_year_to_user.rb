class AddAppYearToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :app_year, :string
  end
end
