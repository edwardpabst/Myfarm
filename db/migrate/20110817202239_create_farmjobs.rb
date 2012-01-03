class CreateFarmjobs < ActiveRecord::Migration
  def self.up
    create_table :farmjobs do |t|
      t.integer :user_id
      t.integer :fieldtask_id
      t.integer :field_id
      t.integer :crop_id
      t.float :area_size
      t.date :start_date
      t.time :start_time
      t.date :stop_date
      t.time :stop_time
      t.float :total_hours
      t.string :notes
      t.integer :equipment_id
      t.float :applied_area
      t.float :plan_rate
      t.float :actual_rate
      t.string :growth_stage
      t.string :application_method
      t.string :soil_condition
      t.string :soil_type
      t.string :weather_segment

      t.timestamps
    end
  end

  def self.down
    drop_table :farmjobs
  end
end
