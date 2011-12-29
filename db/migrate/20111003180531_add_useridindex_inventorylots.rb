class AddUseridindexInventorylots < ActiveRecord::Migration
  def self.up
    add_index :inventorylots, :user_id
    add_index :scaletickets, :user_id
    add_index :farmjobs, :user_id
    add_index :fields, :user_id
  end

  def self.down
  end
end
