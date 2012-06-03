class ChangePrecisionScaleInit < ActiveRecord::Migration
  def self.up
  change_column :supplies, :carrier_rate_acre, :decimal, { :scale => 2, :precision => 9 }
    
  end

  def self.down
    change_column :supplies, :supply_cost_uom, :decimal
  end
end

