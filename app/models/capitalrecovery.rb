class Capitalrecovery < ActiveRecord::Base
  attr_accessible :recovery_year, :interest_rate, :recovery_factor 
  
  def self.build_recovery_data
    
    filename = 'public/system/capitalrecoverfactors.csv'
    file = File.new(filename, 'r')
 
    file.each_line("\r") do |row|
     
      columns = row.split(",")
      #logger.debug "CSV PARSER ROW - #{columns}"
      @capitalrecovery = Capitalrecovery.new 

 
      col_count = 0
      columns.each do |col|
        if col_count == 0
           @capitalrecovery.recovery_year = col
        elsif  col_count == 1
           @capitalrecovery.interest_rate = col
        elsif col_count == 2
           @capitalrecovery.recovery_factor = col
        end
        col_count += 1
      end
      
      @capitalrecovery.save
    end
  end
  
  def self.get_factor(years, rate)
    @capitalrecovery = Capitalrecovery.find_by_sql("Select * from capitalrecoveries 
                                        where recovery_year = #{years}
                                        and interest_rate = #{rate}") 
    @capitalrecovery.each do |cr|
      return cr.recovery_factor
    end
  end
end
