class AddRowsField < ActiveRecord::Migration
  def self.up
     
    add_column :fields, :start_row, :string
    add_column :fields, :end_row, :string
  end

  def self.down
    remove_column :fields, :start_row 
    remove_column :fields, :end_row 
  end
end
