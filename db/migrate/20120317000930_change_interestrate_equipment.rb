class ChangeInterestrateEquipment < ActiveRecord::Migration
  def self.up
     remove_column :equipment, :interest_rate
     add_column :equipment, :interest_rate, :integer

  end

  def self.down

    remove_column :equipment, :interest_rate
  
  end
end
