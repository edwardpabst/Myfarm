class AddFieldColumns < ActiveRecord::Migration
  def self.up
    
    remove_column :fields, :country_id
    add_column :fields, :country_id, :integer
   
 
 
  end

  def self.down
  

    
 
  end
end

