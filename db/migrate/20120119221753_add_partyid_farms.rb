class AddPartyidFarms < ActiveRecord::Migration
  def self.up
    add_column :farms, :party_id, :integer
  end

  def self.down
    remove_column :farms, :party_id

  end
end
