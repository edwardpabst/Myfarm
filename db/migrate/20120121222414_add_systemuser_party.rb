class AddSystemuserParty < ActiveRecord::Migration
  def self.up
    add_column :parties, :system_user_id, :integer
  end

  def self.down
    remove_column :parties, :system_user_id

  end
end
