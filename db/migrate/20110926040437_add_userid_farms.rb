class AddUseridFarms < ActiveRecord::Migration
  def self.up
    add_column :farms, :user_id, :integer
    add_index :farms, :user_id
  end

  def self.down
    remove_column :farms, :user_id
  end
end
