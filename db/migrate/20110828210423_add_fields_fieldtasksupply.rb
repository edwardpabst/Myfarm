class AddFieldsFieldtasksupply < ActiveRecord::Migration
  
  def self.up
    add_column :fieldtasksupplies, :usage_uom, :string
    add_column :fieldtasksupplies, :qty_required, :float
  end

  def self.down
    remove_column :fieldtasksupplies, :usage_uom 
    remove_column :fieldtasksupplies, :qty_required 
  end
end
