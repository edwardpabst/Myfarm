class AddNoteOrderdetail < ActiveRecord::Migration
  def self.up
     
   
     add_column :retailorderdetails, :detail_notes, :string
     

  end

  def self.down

 
    remove_column :retailorderdetails, :detail_notes
    
  
  end
end
