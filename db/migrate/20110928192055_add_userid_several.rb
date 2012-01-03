class AddUseridSeveral < ActiveRecord::Migration
  def self.up 
    add_column :inventorylots, :user_id, :integer
    add_column :contracts, :user_id, :integer
    add_column :harvestsources, :user_id, :integer
    add_column :scaletickets, :user_id, :integer
    

  end

  def self.down
    add_column :inventorylots, :user_id 
    add_column :contracts, :user_id 
    add_column :harvestsources, :user_id 
    add_column :scaletickets, :user_id 
  end
end
