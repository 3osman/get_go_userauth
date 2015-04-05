class RenameUniversityToCityOfStudies < ActiveRecord::Migration
  def change
    rename_column :users, :university, :city_of_studies

  end
end
