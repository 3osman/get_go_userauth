class AddDoneToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :done, :boolean
  end
end
