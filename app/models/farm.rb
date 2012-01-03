class Farm < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :farmname, :total_acres , :land_expense_year
  has_many :farmexpenses
    
                 
  validates_presence_of :farmname, :total_acres
end
