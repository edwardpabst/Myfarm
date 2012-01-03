class AddColumnEventname < ActiveRecord::Migration
  def self.up

    add_column :events, :eventname, :string
  end

  def self.down
    remove_column :events, :eventname 
 
  end
end
