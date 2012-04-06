class Podetail < ActiveRecord::Base
   #  acts_as_reportable
    attr_accessible :user_id, :po_id, :supply_id, :storage_id, :qty_ordered, :supply_uom, :order_price, :ext_amount, 
                    :detail_status, :qty_received, :receipt_amount 

    belongs_to :po
    has_many :supplies
    has_many :storages




    validates_presence_of  :supply_id, :qty_ordered, :supply_uom, :order_price,  :detail_status 
    validates :qty_ordered, :numericality => true 
    validates :order_price, :numericality => true 
  end
