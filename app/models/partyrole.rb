class Partyrole < ActiveRecord::Base
  
  #acts_as_reportable
  attr_accessible :party_id, :partytype_id
  belongs_to :party
  belongs_to :partytype
  
  #scope :roles, lambda { |id|  joins(:Partytype).where('party_id = ?',  id) } 
  #, joins(:partytypes).where('partyroles.partytype_id => partytypes.id')
  
end