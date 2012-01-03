class CreateSupplyinventoryTrans < ActiveRecord::Migration
  def self.up
    create_table :supplyinventory_trans do |t|
      t.integer :supplyinventory_id
      t.string :supply_tran_type
      t.integer :supply_tran_type_id
      t.float :supply_tran_qty
      t.float :supply_tran_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :supplyinventory_trans
  end
end
