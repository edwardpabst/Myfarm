class CreateEventSeries < ActiveRecord::Migration
  def self.up
    create_table :event_series do |t|
      t.integer :frequency
      t.integer :user_id
      t.string :period
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :all_day

      t.timestamps
    end
    add_index :event_series, :user_id
  end

  def self.down
    drop_table :event_series
  end
end

#
# Table name: event_series
#
#  id         :integer(4)      not null, primary key
#  frequency  :integer(4)      default(1)
#  period     :string(255)     default("months")
#  starttime  :datetime
#  endtime    :datetime
#  all_day    :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#