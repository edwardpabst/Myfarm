class AddNamesRetailorder < ActiveRecord::Migration
  def self.up
     
   
     add_column :retailorders, :customername, :string
     

  end

  def self.down

 
    remove_column :retailorders, :customername
    
  
  end
end
