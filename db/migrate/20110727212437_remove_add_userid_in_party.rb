class RemoveAddUseridInParty < ActiveRecord::Migration
  def self.up
    add_column :parties, :user_id, :integer
    remove_column :parties, :userid
  end

  def self.down
  end
end
