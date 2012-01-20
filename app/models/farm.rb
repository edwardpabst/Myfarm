class Farm < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :farmname, :total_acres , :land_expense_year, :party_id,
                  :logo_file_name, :logo_content_type, :logo_file_size, :logo_updated_at, :logo
  has_many :farmexpenses
    
  has_attached_file :logo, :styles => { :large=> "700x700>", :medium => "300x300>", :small => "200x200>", :thumb => "120x120>" }
                 
  validates_presence_of :farmname, :total_acres, :party_id
end
