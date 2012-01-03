class AddUseridShipmentdetail < ActiveRecord::Migration
  def self.up
     
    add_column :shipmentdetails, :user_id, :integer
 

  end

  def self.down
    remove_column :shipmentdetails, :user_id
      
 
  end
end
