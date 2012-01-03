class AddFarmidFields < ActiveRecord::Migration
  def self.up
      add_column :fields, :farm_id, :integer
      add_index :fields, :farm_id
  end

  def self.down
    remove_column :fields, :farm_id
  end
end
