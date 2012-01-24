class AddIndexSystemuserParty < ActiveRecord::Migration
  def self.up
    add_index :parties, :system_user_id
 
  end

  def self.down
  end
end
