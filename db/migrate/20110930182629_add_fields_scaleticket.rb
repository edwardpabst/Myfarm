class AddFieldsScaleticket < ActiveRecord::Migration
  def self.up
      add_column :scaletickets, :field_id_1, :integer
      add_column :scaletickets, :field_pct_1, :integer
      add_column :scaletickets, :field_id_2, :integer
      add_column :scaletickets, :field_pct_2, :integer
      add_column :scaletickets, :field_id_3, :integer
      add_column :scaletickets, :field_pct_3, :integer
      add_column :scaletickets, :field_id_4, :integer
      add_column :scaletickets, :field_pct_4, :integer
  end

  def self.down
      remove_column :scaletickets, :field_id_1 
      remove_column :scaletickets, :field_pct_1 
      remove_column :scaletickets, :field_id_2
      remove_column :scaletickets, :field_pct_2
      remove_column :scaletickets, :field_id_3 
      remove_column :scaletickets, :field_pct_3
      remove_column :scaletickets, :field_id_4 
      remove_column :scaletickets, :field_pct_4
  end
end
