class CreateFarmjobequipments < ActiveRecord::Migration
  def self.up
    create_table :farmjobequipments do |t|
      t.integer :user_id
      t.integer :farmjob_id
      t.integer :equipment_id
      t.float :qty_required
      t.float :qty_actaul
      t.float :additional_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :farmjobequipments
  end
end
