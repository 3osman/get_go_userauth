class CreateRoadmaps < ActiveRecord::Migration
  def change
    create_table :roadmaps do |t|
      t.integer :user_id
      t.integer :rating
      t.string :country

      t.timestamps null: false
    end
  end
end
