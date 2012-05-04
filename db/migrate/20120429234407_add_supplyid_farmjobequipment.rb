class AddSupplyidFarmjobequipment < ActiveRecord::Migration
  def self.up
     
   
     add_column :farmjobequipments, :farmjobsupply_id, :integer
     

  end

  def self.down

 
    remove_column :farmjobequipments, :farmjobsupply_id
    
  
  end
end
