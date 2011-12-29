class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer :party_id
      t.integer :cropplan_id
      t.string :contract_uom
      t.float :contract_price
      t.datetime :contract_date
      t.string :notes
      t.float :min_qty
      t.float :max_qty
      t.string :payment_type
      t.string :payment_terms

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
