class AddIndexFarmnameFields < ActiveRecord::Migration
  def self.up
    
    add_index :fields, :farmname
  end

  def self.down
     
  end
end
