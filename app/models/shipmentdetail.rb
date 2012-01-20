class Shipmentdetail < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :user_id, :shipment_id, :inventorylot_id,  
                  :price, :qty_uom, :qty , :ext_amount, :detail_status, :notes,
                  :original_inv_amount
                  
     belongs_to :Shipment 
     
     
    def self.get_shipment_details(user_id, shipment_id)
       return Shipmentdetail.find_by_sql("Select cropplanfull, storages.name as storagename, 
       inventorylots.grade, qty, qty_uom, price, ext_amount 
      from shipmentdetails 
      join cropplans on shipmentdetails.cropplan_id = cropplans.id
      join inventorylots on shipmentdetails.inventorylot_id = inventorylots.id
      join storages on inventorylots.storage_id = storages.id

      where shipmentdetails.user_id = #{user_id} and shipmentdetails.shipment_id = #{shipment_id}")
      
      
    end             
end
