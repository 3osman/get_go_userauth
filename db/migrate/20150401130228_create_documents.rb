class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.integer :task_id

      t.timestamps null: false
    end
  end
end
