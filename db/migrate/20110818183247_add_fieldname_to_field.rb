class AddFieldnameToField < ActiveRecord::Migration
  def self.up
    add_column :fields, :fieldname, :string
  end

  def self.down
    remove_column :fields, :fieldname
  end
end
