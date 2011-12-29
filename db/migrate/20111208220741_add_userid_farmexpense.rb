class AddUseridFarmexpense < ActiveRecord::Migration
  def self.up
      add_column :farmexpenses, :user_id, :integer
      add_index :farmexpenses, :user_id
  end

  def self.down
    remove_column :farmexpenses, :user_id
  end
end
