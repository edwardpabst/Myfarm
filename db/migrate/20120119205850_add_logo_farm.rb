class AddLogoFarm < ActiveRecord::Migration
  def self.up
    add_column :farms, :logo, :string
    add_column :farms, :logo_file_name, :string
    add_column :farms, :logo_content_type, :string
    add_column :farms, :logo_file_size, :integer
    add_column :farms, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :farms, :logo 
    remove_column :farms, :logo_file_name
    remove_column :farms, :logo_content_type
    remove_column :farms, :logo_file_size
    remove_column :farms, :logo_updated_at
  end
end
