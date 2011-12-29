class ChangeFieldEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :field 
    add_column :events, :fieldname, :string
  end

  def self.down
    remove_column :events, :fieldname 
 
  end
end
