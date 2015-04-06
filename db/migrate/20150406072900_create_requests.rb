class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :settle_buddy_id
      t.integer :client_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
