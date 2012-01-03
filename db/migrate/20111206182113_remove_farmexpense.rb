class RemoveFarmexpense < ActiveRecord::Migration
  def self.up
     drop_table :farmexpenses
  end

  def self.down
  end
end
