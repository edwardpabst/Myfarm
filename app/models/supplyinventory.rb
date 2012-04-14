class Supplyinventory < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :supply_id, :supply_uom, :user_id, :storage_id, :qty_in, :qty_onhand, :qty_out, 
                  :onhand_value, :avg_cost 
  
  belongs_to :Supply
  has_many :storages
 
 
  def self.get_total_value(user_id) 
    
      sql_statement = "Select sum(onhand_value) as onhand_value
       from supplyinventories
       where supplyinventories.user_id = #{user_id}
       "            
    @supplyinventory = Supplyinventory.find_by_sql("#{sql_statement}")
    @onhand_value = 0
    @supplyinventory.each do |s|
      @onhand_value += s.onhand_value
    end
    return @onhand_value
  end
end
