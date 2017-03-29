class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :format
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
