class AddApplicationTimeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :application_time, :string
  end
end
