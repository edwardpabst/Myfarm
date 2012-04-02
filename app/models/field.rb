class Field < ActiveRecord::Base
  #acts_as_reportable
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :check_process => false,
                    :address => "location", :normalized_address => "location",
                    :msg => "Sorry, not even Google could figure out where that is" 
  
  attr_accessible :fieldname, :farmname, :location, :country_id, :number_acres, :holding_status, 
  :owner_id, :client_id, :area_mapped, :area_legal, :area_tillable, :current_state, 
  :longitude, :latitude, :gmaps, :start_row, :end_row, :user_id, :land_expense_year,  
  :soil_testlab_id, :soil_testresults_file, :farm_id, :percent_harvest_acre, :fixed_amount_acre, :fixed_uom ,
  :soilreport, :soilreport_file_name, :soilreport_content_type, :soilreport_file_size, :soilreport_updated_at
  
  validates_presence_of :farmname, :fieldname, :country_id, :number_acres, :holding_status
  belongs_to :country
  has_many :farmjobs
  has_many :fieldmappings
  
  has_attached_file :soilreport
  
   before_save :gmaps4rails_address


   def prevent_geocoding
     address.blank? || (!lat.blank? && !lng.blank?) 
   end
   
  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.location}" 
  end
  
  def gmaps4rails_title
    "#{self.fieldname}"
  end
  
  def gmaps4rails_infowindow
    "<ul> Field - #{self.fieldname} </ul> <ul> Acres - #{self.number_acres} </ul>"
   
  end
  
  def self.get_clientlist(user_id)
    return Farmexpense.find_by_sql("Select client_id
                             from fields
                             where fields.user_id =  #{user_id}
                             and client_id > 0 ")
  end
  
end
