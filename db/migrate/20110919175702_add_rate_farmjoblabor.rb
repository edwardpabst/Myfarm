class AddRateFarmjoblabor < ActiveRecord::Migration
  def self.up
    add_column :farmjoblabors, :rate, :float
  
  end

  def self.down
    remove_column :farmjoblabors, :rate
  end
end
