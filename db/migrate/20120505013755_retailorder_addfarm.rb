class RetailorderAddfarm < ActiveRecord::Migration
  def self.up
     
   
     add_column :retailorders, :farm_id, :integer
     

  end

  def self.down

 
    remove_column :retailorders, :farm_id
    
  
  end
end
