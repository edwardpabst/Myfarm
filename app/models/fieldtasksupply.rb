class Fieldtasksupply < ActiveRecord::Base
  
  #acts_as_reportable
  attr_accessible :fieldtask_id, :supply_id, :usage_uom, :qty_required
  belongs_to :fieldtask
  belongs_to :supply
  
 
end
