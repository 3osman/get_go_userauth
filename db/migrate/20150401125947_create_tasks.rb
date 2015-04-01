class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :done
      t.date :deadline
      t.string :name
      t.integer :roadmap_id

      t.timestamps null: false
    end
  end
end
