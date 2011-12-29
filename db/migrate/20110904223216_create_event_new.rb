class CreateEventNew < ActiveRecord::Migration
    def self.up
      drop_table :events
      create_table :events do |t|
        t.integer :user_id
        t.string :name
        t.datetime :start_at
        t.datetime :end_at
        t.boolean :all_day
        t.string :notes
        t.integer :farmjob_id


        t.timestamps
      end
      add_index :events, :user_id
       add_index :events, :farmjob_id
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
