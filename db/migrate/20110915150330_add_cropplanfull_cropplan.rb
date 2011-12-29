class AddCropplanfullCropplan < ActiveRecord::Migration
  def self.up
    add_column :cropplans, :cropplanfull, :string
     
  end

  def self.down
    remove_column :cropplans, :cropplanfull
  end
end
