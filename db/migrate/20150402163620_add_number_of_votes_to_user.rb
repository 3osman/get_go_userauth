class AddNumberOfVotesToUser < ActiveRecord::Migration
  def change
    add_column :users, :number_of_votes, :integer
  end
end
