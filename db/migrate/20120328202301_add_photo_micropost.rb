class AddPhotoMicropost < ActiveRecord::Migration
  def self.up
    add_column :microposts, :microphoto, :string
    add_column :microposts, :microphoto_file_name, :string
    add_column :microposts, :microphoto_content_type, :string
    add_column :microposts, :microphoto_file_size, :integer
    add_column :microposts, :microphoto_updated_at, :datetime
  end

  def self.down
    remove_column :microposts, :microphoto
    remove_column :microposts, :microphoto_file_name
    remove_column :microposts, :microphoto_content_type
    remove_column :microposts, :microphoto_file_size
    remove_column :microposts, :microphoto_updated_at

  end
end
