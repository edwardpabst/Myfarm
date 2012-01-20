class Party < ActiveRecord::Base
  
  #acts_as_reportable
  attr_accessor :partyworkdescription
  attr_accessible :partylastname, :partyfirstname, :partyname, :partyaddress1, :partycity, :partystate, :partycountry,
  :partyphone, :partyemail, :partypostalcode, :partyjobtitle, :partytype_ids, :country_id, :rate_hour, :charge_hour,
  :ship_address1, :ship_city, :ship_state, :ship_phone, :partyweatherpostalcode, :farm_id
  
  belongs_to :user
  belongs_to :country
  has_many :partyroles
  has_many :partytypes, :through => :partyroles 
  validates_presence_of  :partyphone, :partyemail 
  
  
  def partyworkdescription
    "#{self.partyname}: #{self.partyjobtitle}"
  end
  
  def  self.find_party_by_user_id(id)  
   return Party.select("partyweatherpostalcode").where('user_id' => id).limit(1)  
  end
  

end
 