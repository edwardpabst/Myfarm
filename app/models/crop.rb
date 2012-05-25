class Crop < ActiveRecord::Base
 #acts_as_reportable
  attr_accessible :cropname, :croptype, :cropspecific, :user_id, :crop_uom, :price_per_uom, :crop_inventory_uom, 
  :avg_yield_acre, :avg_moisture_percent , :avg_weight_uom, :seed_company_id,  :variety_hybrid,  :lot_id,  
  :seed_rate_uom,   :seed_rate_land,  :seed_rate,  :plant_depth, :crop_purpose
    
  has_many :cropplans, :dependent => :restrict
  belongs_to :Cropinventory
 
 validates :price_per_uom, :numericality => true
 validates :avg_yield_acre, :numericality => true
  
  	     validates_presence_of :cropname, :croptype, :crop_uom, :crop_inventory_uom, :avg_yield_acre
          
  def cropfull
    "#{self.cropname}: #{self.cropspecific}"
  end
  
  def  find_crop_by_croptype(croptype)  
   @crops = Crop.select("cropname", "cropspecific", "croptype", "crop_uom", "price_per_uom", "crop_inventory_uom", "avg_yield_acre").where('croptype' => croptype)   
  end
end
