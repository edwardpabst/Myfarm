class Supply < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :supplyname, :item_number, :supply_type, :supply_uom, :supply_cost_uom, :supply_charge_uom,
  :distribution_uom, :rate_acre, :epa_id, :manufacturer, :formulation, 
                  :carrier, :carrier_rate_acre, :problem_target, :conversion_factor 
  
  belongs_to :Farmjob
  has_many :fieldtasksupplies, :dependent => :destroy
  has_many :fieldtasks, :through => :fieldtasksupplies
 
  	      
  validates_presence_of :supplyname, :item_number, :supply_type, :supply_uom, :supply_cost_uom
  
  
          def supplyfull
            "#{self.supplyname}: #{self.supply_uom}"
          end
end
