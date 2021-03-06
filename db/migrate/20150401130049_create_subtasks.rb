class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.text :description
      t.boolean :done
      t.date :deadline
      t.string :name
      t.integer :task_id

      t.timestamps null: false
    end
  end
end
