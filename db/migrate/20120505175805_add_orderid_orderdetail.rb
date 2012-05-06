class AddOrderidOrderdetail < ActiveRecord::Migration
  def self.up
     
   
     add_column :retailorderdetails, :retailorder_id, :integer
     

  end

  def self.down

 
    remove_column :retailorderdetails, :retailorder_id
    
  
  end
end
