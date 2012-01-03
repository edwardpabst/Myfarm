class AddPartyColumns < ActiveRecord::Migration
  def self.up

    add_column :parties, :rate_hour, :floating
   
 
 
  end

  def self.down
  

    remove_column :parties, :rate_hour, :floating
 
  end
end
