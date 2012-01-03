class AddAdminUser < ActiveRecord::Migration
  def self.up

    add_column :users, :security_question, :string
    add_column :users, :security_answer, :string
  end

  def self.down
    remove_column :users, :security_question 
    remove_column :users, :security_answer
 
  end
end
