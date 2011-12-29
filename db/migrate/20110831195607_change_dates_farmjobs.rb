class ChangeDatesFarmjobs < ActiveRecord::Migration
    def self.up
      remove_column :farmjobs, :start_date
      remove_column :farmjobs, :stop_date
      add_column :farmjobs, :start_date, :datetime
      add_column :farmjobs, :stop_date, :datetime
      add_column :farmjobs, :job_status, :string
      add_column :farmjobs, :workorder, :string
    end

    def self.down
      remove_column :farmjobs, :job_status
      remove_column :farmjobs, :start_date
      remove_column :farmjobs, :stop_date 
    end
  
end
