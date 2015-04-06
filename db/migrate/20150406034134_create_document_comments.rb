class CreateDocumentComments < ActiveRecord::Migration
  def change
    create_table :document_comments do |t|
      t.text :comment
      t.integer :task_id
      t.integer :rating

      t.timestamps null: false
    end
  end
end
