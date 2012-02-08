class AddGradeScaleticket < ActiveRecord::Migration
  def self.up
    add_column :scaletickets, :grade, :string
  end

  def self.down
    remove_column :scaletickets, :grade

  end
end
