class AddNameAndCountryAndUniversityAndDurationToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :country, :string
    add_column :users, :university, :string
    add_column :users, :duration, :string
  end
end
