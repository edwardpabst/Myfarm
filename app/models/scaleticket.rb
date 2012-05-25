class Scaleticket < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :user_id, :ticket_id, :tran_date, :cropplan_id, :storage_id, :gross_weight, :tare_weight, :net_weight,
                  :moisture_pct, :party_id, :pack_qty, :weight_uom, :field_id_1, :field_pct_1, :field_id_2, :field_pct_2,
                  :field_id_3, :field_pct_3,:field_id_4, :field_pct_4, :weight_conversion, 
                  :inventory_uom, :inventory_update, :grade
  

  has_many :cropplans 
  has_many :parties
  has_many :inventorytickets, :dependent => :restrict
  before_save :default_values 
 
   validates :gross_weight, :numericality => true
   validates :tare_weight, :numericality => true
   validates :net_weight, :numericality => true	      
  validates_presence_of :tran_date, :cropplan_id, :field_id_1, :storage_id, :inventory_update, :pack_qty 
  # :storage_id, :gross_weight, :tare_weight, :net_weight,
  validate :field_pct_validation
    #------------------------------------------------------------------------------

def self.get_by_cropplan_field(cropplan_id, field_id)
  
  return @st = Scaleticket.find_by_sql(" Select * 
               from scaletickets 
               where cropplan_id = #{cropplan_id} 
               and field_id_1 = #{field_id}")
  
end

 private
 
    def default_values
      self.field_pct_1 = 100 unless ((self.field_pct_1 + self.field_pct_2 + self.field_pct_3 + self.field_pct_4) != 0)
    end
    
    def field_pct_validation
      validate_field_pct
      pct_total = (self.field_pct_1 + self.field_pct_2 + self.field_pct_3 + self.field_pct_4)
      if pct_total != 0 and pct_total != 100
        self.errors.add(:base , "field source percent must total to 100.")
      end
    end
    
    def validate_field_pct
      if self.field_pct_1.blank? 
        self.field_pct_1 = 0
      end
      if   self.field_pct_2.blank? 
        self.field_pct_2 = 0
      end
      if   self.field_pct_3.blank? 
        self.field_pct_3 = 0
      end
      if   self.field_pct_4.blank? 
        self.field_pct_4 = 0
      end
    end
end
