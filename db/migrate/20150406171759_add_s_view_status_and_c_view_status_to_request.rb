class AddSViewStatusAndCViewStatusToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :s_view_status, :boolean, :default => false
    add_column :requests, :c_view_status, :boolean, :default => false
  end
end
