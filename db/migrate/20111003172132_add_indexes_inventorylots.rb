class AddIndexesInventorylots < ActiveRecord::Migration
  def self.up
    add_index :inventorylots, :scaleticket_id
    add_index :inventorylots, :cropplan_id
    add_index :inventorylots, :storage_id
  end

  def self.down
  end
end
