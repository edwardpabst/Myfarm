class Partytype < ActiveRecord::Base
  
 
  
  has_many :partyroles
  has_many :parties, :through => :partyroles
end
