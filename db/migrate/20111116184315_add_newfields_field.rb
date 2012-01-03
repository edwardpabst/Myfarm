class AddNewfieldsField < ActiveRecord::Migration
  def self.up
     
    add_column :farms, :land_expense_year, :float
    add_column :fields, :land_expense_year, :float
    add_column :fields, :soil_testlab_id, :integer
    add_column :fields, :soil_testresults_file, :string
 
    
 
  
   
  end

  def self.down
    remove_column :fields, :land_expense_year 
    remove_column :farms, :land_expense_year
    remove_column :fields, :soil_testlab_id
    remove_column :fields, :soil_testresults_file
 
 
 
    
  end
end
