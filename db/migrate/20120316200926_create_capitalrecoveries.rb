class CreateCapitalrecoveries < ActiveRecord::Migration
  def self.up
    create_table :capitalrecoveries do |t|
      t.integer :recovery_year
      t.integer :interest_rate
      t.decimal :recovery_factor

      t.timestamps
    end
  end

  def self.down
    drop_table :capitalrecoveries
  end
end
