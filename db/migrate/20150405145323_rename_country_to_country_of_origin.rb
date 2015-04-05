class RenameCountryToCountryOfOrigin < ActiveRecord::Migration
  def change
    rename_column :users, :country, :country_of_origin

  end
end
