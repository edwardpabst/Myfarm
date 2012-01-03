class CreateZtimesAgain < ActiveRecord::Migration
  def self.up
     drop_table :ztimes
     create_table :ztimes do |t|
       t.string :timekey
       t.string :timedisplay

       t.timestamps
     end
   end

   def self.down
     drop_table :ztimes
   end
end
