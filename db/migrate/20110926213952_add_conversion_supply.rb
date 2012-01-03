class AddConversionSupply < ActiveRecord::Migration
  def self.up
    add_column :supplies, :conversion_factor, :float

  end

  def self.down
    remove_column :supplies, :conversion_factor
  end
end
