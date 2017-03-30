class AddDocumentToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :document, :string
  end
end
