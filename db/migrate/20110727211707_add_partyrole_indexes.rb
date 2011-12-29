class AddPartyroleIndexes < ActiveRecord::Migration
  def self.up
    add_index :partyroles, :party_id
    add_index :partyroles, :partytype_id
  end

  def self.down
    remove_index :partyroles, :party_id
    remove_index :partyroles, :partytype_id
  end
end
