class AddMoistureCrops < ActiveRecord::Migration
  def self.up
     
    add_column :crops, :avg_moisture_percent, :float
    add_column :crops, :avg_weight_uom, :float
  end

  def self.down
  end
end
