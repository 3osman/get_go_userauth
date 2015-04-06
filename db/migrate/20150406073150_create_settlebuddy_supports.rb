class CreateSettlebuddySupports < ActiveRecord::Migration
  def change
    create_table :settlebuddy_supports do |t|
      t.boolean :bank, default:false
      t.boolean :visa, default:false
      t.boolean :housing, default:false
      t.boolean :public_transport, default:false
      t.boolean :caf, default:false
      t.boolean :telecommunication, default:false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
