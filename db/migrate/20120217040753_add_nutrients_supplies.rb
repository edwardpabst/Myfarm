class AddNutrientsSupplies < ActiveRecord::Migration
  def self.up
    add_column :supplies, :nitrogen_content, :decimal, { :scale => 2, :precision => 9 }
    add_column :supplies, :phosphorous_content, :decimal, { :scale => 2, :precision => 9 }
    add_column :supplies, :potassium_content,  :decimal, { :scale => 2, :precision => 9 }
    add_column :supplies, :calcium_content, :decimal, { :scale => 2, :precision => 9 }
    add_column :supplies, :manganese_content, :decimal, { :scale => 2, :precision => 9 }
    add_column :supplies, :magnesium_content, :decimal, { :scale => 2, :precision => 9 }
  end

  def self.down
    remove_column  :supplies, :nitrogen_content
    remove_column  :supplies, :phosphorous_content
    remove_column  :supplies, :potassium_content
    remove_column  :supplies, :calcium_content
    remove_column  :supplies, :manganese_content
    remove_column  :supplies, :magnesium_content
  end
end
 