class AddStorageidScaleticket < ActiveRecord::Migration
  def self.up 
    add_column :scaletickets, :storage_id, :integer

  end

  def self.down
    remove_column :scaletickets, :storage_id
  end
end
