class ChangeDecimalPrecision < ActiveRecord::Migration
  def self.up
    change_column :supplies, :supply_cost_uom, :decimal, { :scale => 2, :precision => 9 }
    change_column :supplies, :rate_acre, :decimal, { :scale => 2, :precision => 9 }
    change_column :supplies, :carrier_rate_acre, :decimal, { :scale => 2, :precision => 9 }
    change_column :supplies, :conversion_factor, :decimal, { :scale => 2, :precision => 9 }
    change_column :supplies, :supply_charge_uom, :decimal, { :scale => 2, :precision => 9 }
  end

  def self.down
  end
end
