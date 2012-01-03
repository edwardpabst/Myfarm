class CreateFarmexpenses < ActiveRecord::Migration
  def self.up
    create_table :farmexpenses do |t|
      t.integer :farm_id
      t.string :expense_type
      t.string :expense_name
      t.float :expense_amount
      t.string :expense_year

      t.timestamps
    end
  end

  def self.down
    drop_table :farmexpenses
  end
end
