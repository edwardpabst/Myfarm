class Partyrole < ActiveRecord::Base
  attr_accessible :party_id, :partytype_id
  belongs_to :party
  belongs_to :partytypes
  
end