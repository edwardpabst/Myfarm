class AddAttachfileFieldInventory < ActiveRecord::Migration
      def self.up
        add_column :fields, :soilreport_file_name,    :string
        add_column :fields, :soilreport_content_type, :string
        add_column :fields, :soilreport_file_size,    :integer
        add_column :fields, :soilreport_updated_at,   :datetime
        
        add_column :inventorylots, :cropreport_file_name,    :string
        add_column :inventorylots, :cropreport_content_type, :string
        add_column :inventorylots, :cropreport_file_size,    :integer
        add_column :inventorylots, :cropreport_updated_at,   :datetime
      end
    
      def self.down
       remove_column :fields, :soilreport_file_name
       remove_column :fields, :soilreport_content_type
       remove_column :fields, :soilreport_file_size
       remove_column :fields, :soilreport_updated_at
       
       remove_column :inventorylots, :cropreport_file_name
       remove_column :inventorylots, :cropreport_content_type
       remove_column :inventorylots, :cropreport_file_size
       remove_column :inventorylots, :cropreport_updated_at
  14   end
end
