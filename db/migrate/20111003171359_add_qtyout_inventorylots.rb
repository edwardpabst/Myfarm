class AddQtyoutInventorylots < ActiveRecord::Migration
    def self.up
      remove_column :inventorylots, :qty 
      add_column :inventorylots, :qty_in, :float
      add_column :inventorylots, :qty_out, :float
      add_column :inventorylots, :qty_onhand, :float

    end

    def self.down
       remove_column :inventorylots, :qty_in
       remove_column :inventorylots, :qty_out
       remove_column :inventorylots, :qty_onhand
    end
  
end
