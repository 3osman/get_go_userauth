class ChangeColumnDef < ActiveRecord::Migration
  def change
    change_column_default(:users, :admin, false)
    change_column_default(:users, :rating, 0)

  end
end
