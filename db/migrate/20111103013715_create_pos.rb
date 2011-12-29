class CreatePos < ActiveRecord::Migration
  def self.up
    create_table :pos do |t|
      t.string :ponumber
      t.integer :user_id
      t.date :orderdate
      t.date :duedate
      t.string :po_status
      t.string :payment_type
      t.string :payment_number
      t.integer :supplier_id
      t.string :notes
      t.string :po_type
      t.float :order_amount

      t.timestamps
    end
  end

  def self.down
    drop_table :pos
  end
end
