class AddProtectedType < ActiveRecord::Migration
  def self.up
     
    add_column :types, :type_isprotected, :boolean
 
  
   
  end

  def self.down
    remove_column :types, :type_isprotected
 
 
    
  end
end
