class AddNumberScaleticket < ActiveRecord::Migration
  def self.up 
    add_column :scaletickets, :ticket_id, :string

  end

  def self.down
    remove_column :scaletickets, :ticket_id
  end
end
