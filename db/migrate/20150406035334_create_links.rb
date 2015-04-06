class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :task_id
      t.string :link_description
      t.string :link_src

      t.timestamps null: false
    end
  end
end
