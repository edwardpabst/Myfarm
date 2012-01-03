class AddYearlycostStorageunit < ActiveRecord::Migration
  def self.up
     
    add_column :storages, :yearly_cost, :float
 
  
   
  end

  def self.down
    remove_column :storages, :yearly_cost
 
 
    
  end
end
