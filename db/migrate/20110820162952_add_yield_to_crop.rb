class AddYieldToCrop < ActiveRecord::Migration
  def self.up
   
    add_column :crops, :avg_yield_acre, :float
  end

  def self.down
    remove_column :crops, :avg_yield_acre
  end
end
