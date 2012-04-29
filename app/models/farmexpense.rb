class Farmexpense < ActiveRecord::Base
  
  attr_accessible :farm_id, :expense_name, :expense_type, :expense_amount, :expense_year, :user_id
  
   validates :expense_amount, :numericality => true 
    belongs_to :Farm
    
                  
  validates_presence_of :expense_name, :expense_type,  :expense_year
 
end
