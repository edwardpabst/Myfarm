class Shipmentdetail < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :user_id, :shipment_id, :inventorylot_id,  
                  :price, :qty_uom, :qty , :ext_amount, :detail_status, :notes,
                  :original_inv_amount
                  
     belongs_to :Shipment              
end
