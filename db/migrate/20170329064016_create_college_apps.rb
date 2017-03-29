class CreateCollegeApps < ActiveRecord::Migration[5.0]
  def change
    create_table :college_apps do |t|
      t.string :name
      t.datetime :deadline
      t.string :category
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :college, foreign_key: true

      t.timestamps
    end
  end
end
