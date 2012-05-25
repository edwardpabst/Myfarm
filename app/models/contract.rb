class Contract < ActiveRecord::Base
  #acts_as_reportable
  
  attr_accessible :party_id, :cropplan_id, :contract_date, :contract_uom, :contract_price, 
         :min_qty, :max_qty, :payment_type, :payment_terms , :notes, :contract_number
  
  has_many :shipments, :dependent => :restrict

 
  	     validates_presence_of :party_id, :cropplan_id, :contract_date, :contract_uom, :contract_price, 
                :min_qty, :max_qty, :payment_terms
          
end
