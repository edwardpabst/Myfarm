class AddUseridIndexes < ActiveRecord::Migration
  def self.up
 
    add_index :parties, :user_id
 
  end

  def self.down
    remove_index :parties, :user_id
  
 
  end
end
