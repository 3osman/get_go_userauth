class AddRatingAndBirthdateAndSettlebuddyAndAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :rating, :integer
    add_column :users, :birthdate, :date
    add_column :users, :settlebuddy, :boolean
    add_column :users, :admin, :boolean
  end
end
