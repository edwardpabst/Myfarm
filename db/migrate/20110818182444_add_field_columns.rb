class AddFieldColumns < ActiveRecord::Migration
  def self.up

    add_column :fields, :country_id, :integer
   
 
 
  end

  def self.down
  
    remove_column :fields, :country_id
    
 
  end
end

