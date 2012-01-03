class CreateEvent < ActiveRecord::Migration
  def self.up
    drop_table :events
    create_table :events do |t|
      t.string :title
      t.integer :event_series_id
      t.integer :user_id
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :all_day
      t.text :description
      t.integer :farmjob_id
      

      t.timestamps
    end
    add_index :events, :user_id
     add_index :events, :event_series_id
  end

  def self.down
    drop_table :events
  end
end


# Table name: events
#
#  id              :integer(4)      not null, primary key
#  title           :string(255)
#  starttime       :datetime
#  endtime         :datetime
#  all_day         :boolean(1)
#  created_at      :datetime
#  updated_at      :datetime
#  description     :text
#  event_series_id :integer(4)