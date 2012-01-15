class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.integer :user_id
      t.string :name_on_card
      t.string :card_last4
      t.string :card_exp_month
      t.string :card_exp_year
      t.datetime :start_date
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
