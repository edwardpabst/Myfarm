class RemoveAddUseridInParty < ActiveRecord::Migration
  def self.up
    remove_column :parties, :userid
    add_column :parties, :user_id, :integer
    
  end

  def self.down
    remove_column :parties, :userid
  end
end
