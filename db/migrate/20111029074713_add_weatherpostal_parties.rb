class AddWeatherpostalParties < ActiveRecord::Migration
  def self.up
     
    add_column :parties, :partyweatherpostalcode, :string
  
   
  end

  def self.down
    remove_column :parties, :partyweatherpostalcode
 
    
  end
end
