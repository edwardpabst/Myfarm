class RecreatePartytype < ActiveRecord::Migration
  def self.up
     add_column :partytypes, :name, :string

  end

  def self.down
    
  end
end
