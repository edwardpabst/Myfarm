class AddUseridCropplans < ActiveRecord::Migration
  def self.up
    add_column :cropplans, :user_id, :integer
  
  end

  def self.down
    remove_column :cropplans, :user_id
  end
end
