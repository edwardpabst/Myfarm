class AddContractnumContract < ActiveRecord::Migration
  def self.up
    add_column :contracts, :contract_number, :string
    add_index :contracts, :user_id
    add_index :contracts, :cropplan_id
    add_index :contracts, :party_id
  end

  def self.down
    remove_column :contracts, :contract_number
  end
end
