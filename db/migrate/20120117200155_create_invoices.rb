class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.string :invoice_number
      t.integer :shipment_id
      t.float :ship_amount
      t.float :ship_charge
      t.float :total_amount
      t.date :invoice_date
      t.string :invoice_terms
      t.string :invoice_status
      t.string :payment_reference

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
