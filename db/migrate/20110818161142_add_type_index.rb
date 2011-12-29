class AddTypeIndex < ActiveRecord::Migration

    def self.up
      add_column :types, :user_id, :integer
      add_index :types, :user_id  

    end

    def self.down
      remove_column :types, :user_id, :integer
      remove_index :types, :user_id
    end
  end

