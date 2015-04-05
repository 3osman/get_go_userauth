class AddPublicRoadmapToUser < ActiveRecord::Migration
  def change
    add_column :users, :public_roadmap, :boolean, :default => false
  end
end
