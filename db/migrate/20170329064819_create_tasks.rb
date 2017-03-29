class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.string :status
      t.boolean :has_attachment
      t.references :college_app, foreign_key: true

      t.timestamps
    end
  end
end
