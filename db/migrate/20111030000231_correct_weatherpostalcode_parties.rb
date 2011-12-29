class CorrectWeatherpostalcodeParties < ActiveRecord::Migration
  def self.up
    remove_column :parties, :partyweatherpostalcode
    add_column :parties, :partyweatherpostalcode, :string
  
   
  end

  def self.down
    remove_column :parties, :partyweatherpostalcode
 
    
  end
end
