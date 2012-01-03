class Country < ActiveRecord::Base
  #acts_as_reportable
  has_many :Parties
  has_many :Fields
  
end
