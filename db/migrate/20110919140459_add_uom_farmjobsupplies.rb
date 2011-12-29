class AddUomFarmjobsupplies < ActiveRecord::Migration
  def self.up
    add_column :farmjobsupplies, :usage_uom, :string
  
  end

  def self.down
    remove_column :farmjobsupplies, :usage_uom
  end
end
