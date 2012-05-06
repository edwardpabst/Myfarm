class CreateRetailcrops < ActiveRecord::Migration
  def self.up
    create_table :retailcrops do |t|
      t.integer :cropplan_id
      t.integer :user_id
      t.integer :farm_id
      t.date :available_date
      t.string :status
      t.boolean :shipday1
      t.boolean :shipday2
      t.boolean :shipday3
      t.boolean :shipday4
      t.boolean :shipday5
      t.boolean :shipday6
      t.boolean :shipday7
      t.boolean :pickupday1
      t.boolean :pickupday2
      t.boolean :pickupday3
      t.boolean :pickupday4
      t.boolean :pickupday5
      t.boolean :pickupday6
      t.boolean :pickupday7
      t.string :sales_uom
      t.decimal :sales_price
      t.string :sales_notes
      t.decimal :ship_charge

      t.timestamps
    end
  end

  def self.down
    drop_table :retailcrops
  end
end
