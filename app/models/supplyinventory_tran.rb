class SupplyinventoryTran < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :supplyinventory_id, :supply_tran_type, :tran_type_id, :supply_tran_qty, :supply_tran_cost 
  belongs_to :Supply
  has_many :storages
 
  def self.addtransaction(tran_type, id,  tran_id, qty, cost)
    @supplyinventory_tran = SupplyinventoryTran.new
    @supplyinventory_tran.supplyinventory_id = id
    @supplyinventory_tran.supply_tran_type = tran_type
    @supplyinventory_tran.supply_tran_type_id = tran_id
    @supplyinventory_tran.supply_tran_qty = qty
    @supplyinventory_tran.supply_tran_cost = cost
    @supplyinventory_tran.save
  end
  
  
  
end
