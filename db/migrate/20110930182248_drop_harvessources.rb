class DropHarvessources < ActiveRecord::Migration
  def self.up
     drop_table :harvestsources
  end

  def self.down
     drop_table :harvestsources
  end
end
