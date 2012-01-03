class Partytype < ActiveRecord::Base
  #acts_as_reportable
  
  attr_accessible :typedescription, :name 
  has_many :partyroles
  has_many :parties, :through => :partyroles
  
end
