class Inventorylot < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :user_id, :scaleticket_id, :cropplan_id, :inventory_uom, :grade, :lab_report, :storage_id,  :qty_in,
    :qty_out_transfer,  :qty_out_ship,  :transfer_amount, :qty_onhand, :cropreport, 
    :cropreport_file_name, :cropreport_content_type, :cropreport_file_size, :cropreport_updated_at
  
  validates :transfer_amount, :numericality => true 
  has_many :cropplans
  has_many :scaletickets
  has_many :storages
  
  has_attached_file :cropreport
  
  def self.get_consolidated_record(scaleticket)
    return @inventory = Inventorylot.find_by_sql("Select *
     from inventorylots  il
     where il.user_id = #{session[:s_user_id]  } 
     and il.cropplan_id = #{scaleticket.cropplan_id}
     and il.storage_id = #{scaleticket.storage_id}")
  end
  
  def self.get_total_value(user_id) 
    
      sql_statement = "Select sum(qty_onhand * price_per_uom) as onhand_value
       from inventorylots il
       join cropplans cp on il.cropplan_id = cp.id
       join crops on cp.crop_id = crops.id
       where il.user_id = #{user_id}
       "            
    @inventorylot = Inventorylot.find_by_sql("#{sql_statement}")
    @onhand_value = 0
    @inventorylot.each do |il|
      @onhand_value += il.onhand_value.to_i
    end
    return @onhand_value
  end
  
end
