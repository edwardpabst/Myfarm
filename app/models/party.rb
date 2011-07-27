class Party < ActiveRecord::Base
  
   
  
  belongs_to :user
  has_many :partyroles
  has_many :partytypes, :through => :partyroles
  validates_presence_of :partylastname, :partyfirstname, :partyname, :partyaddress1, :partycity, :partystate, :partycountry,
  :partyphone, :partyemail,
  
  
end
 