class AddColorEvent < ActiveRecord::Migration
  def self.up
    drop_table :event_series
    add_column :events, :color, :string
    
  end

  def self.down
  
    remove_column :color, :string
 
  end
end
