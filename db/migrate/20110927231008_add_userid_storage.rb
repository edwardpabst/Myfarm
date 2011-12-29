class AddUseridStorage < ActiveRecord::Migration
  def self.up 
    add_column :storages, :user_id, :integer

  end

  def self.down
    remove_column :storages, :user_id
  end
end
