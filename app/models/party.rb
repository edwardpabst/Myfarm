class Party < ActiveRecord::Base
  require 'weather_api.rb'
  require 'nokogiri'
  
  #acts_as_reportable
  attr_accessor :partyworkdescription
  attr_accessible :partylastname, :partyfirstname, :partyname, :partyaddress1, :partycity, :partystate, :partycountry,
  :partyphone, :partyemail, :partypostalcode, :partyjobtitle, :partytype_ids, :country_id, :rate_hour, :charge_hour,
  :ship_address1, :ship_city, :ship_state, :ship_phone, :partyweatherpostalcode, :farm_id, :system_user_id,
  :partyaddress2, :ship_address2, :ship_postalcode
  
  belongs_to :user
  belongs_to :country
  has_many :partyroles
  has_many :partytypes, :through => :partyroles 
  validates_presence_of  :partyphone, :partyemail 
  
  
  def partyworkdescription
    "#{self.partyname}: #{self.partyjobtitle}"
  end
  
  def  self.find_party_by_user_id(id)  
   return Party.select("partyweatherpostalcode").where('user_id' => id).limit(1)  
  end
  
  def self.create_weather
    sql_statement = "Select *
     from users "          
     @users = Party.find_by_sql("#{sql_statement}")
     @users.each do |user|
       Party.get_weather(user.id)
     end 
  end
  
  def self.get_weather(user_id)
   
      @party = Party.find_by_system_user_id(user_id)

      if !@party.nil?
        
          sql_statement = "Select *
           from weathers
           where postalcode = '#{@party.partyweatherpostalcode}'
           and weather_date = '#{Date.today.to_date}'
           "            

           @weather = Party.find_by_sql("#{sql_statement}")

    
        if (@weather.nil? || @weather.blank?) 
          
               @weather = Weather.new
               @weather.postalcode = @party.partyweatherpostalcode
               @weather.weather_date = Date.today.to_date
               @weather.weather_time = Time.now
           
    
                weather = Weatherapi.new
                #doc = Nokogiri::XML.parse weather.read()
                doc = Nokogiri::XML(weather.read(@party.partyweatherpostalcode)) do |config|
                  config.strict.noent
                end


                #--  node - Max temperature
                  parent_node = doc.root.xpath("//temperature[@type='maximum']") 
                  children_named_name = parent_node.xpath(".//name") 
                  children_named_value = parent_node.xpath(".//value") 
                   
                   count = 0
                   children_named_value.each do |ea|
                     count += 1
                     if count == 1
                       @weather.temperature_high =  ea.text
                     end
                   end
                #--  node - Min temperature
                   parent_node = doc.root.xpath("//temperature[@type='minimum']") 
                   children_named_name = parent_node.xpath(".//name") 
                   children_named_value = parent_node.xpath(".//value")
                    
                   count = 0
                   children_named_value.each do |ea|
                     count += 1
                     if count == 1
                       @weather.temperature_low =  ea.text
                     end
                   end
               #--  node - Wind speed
                  parent_node = doc.root.xpath("//wind-speed") 
                  children_named_name = parent_node.xpath(".//name") 
                  children_named_value = parent_node.xpath(".//value")
             
                  count = 0
                  avg_speed = 0
                  children_named_value.each do |ea|
                    count += 1
                    if count <= 6
                      avg_speed += ea.text.to_i
                    end
                  end 
                  avg_speed = (avg_speed / 6)
                  @weather.wind_speed =  avg_speed.to_s 
          
                #--  node - Wind direction
                   parent_node = doc.root.xpath("//direction") 
                   children_named_name = parent_node.xpath(".//name") 
                   children_named_value = parent_node.xpath(".//value")
                  
                    count = 0
                    avg_direction = 0
                    children_named_value.each do |ea|
                      count += 1
                      if count <= 6
                        avg_direction += ea.text.to_i
                      end
                    end 
                    avg_direction = (avg_direction / 6)

                    if (avg_direction > 349 and avg_direction <= 360) || (avg_direction >= 0 and avg_direction <= 11)
                      wind_direction = "N"
                    end
                    if (avg_direction > 11 and avg_direction <= 34) 
                      wind_direction = "N"
                    end
                    if (avg_direction > 11 and avg_direction <= 34) 
                      wind_direction = "NNE"
                    end
                    if (avg_direction > 34 and avg_direction <= 56) 
                      wind_direction = "NE"
                    end
                    if (avg_direction > 56 and avg_direction <= 79) 
                      wind_direction = "ENE"
                    end
                    if (avg_direction > 79 and avg_direction <= 101) 
                      wind_direction = "E"
                    end
                    if (avg_direction > 101 and avg_direction <= 124) 
                      wind_direction = "ESE"
                    end
                    if (avg_direction > 124 and avg_direction <= 146) 
                      wind_direction = "SE"
                    end
                    if (avg_direction > 146 and avg_direction <= 169) 
                      wind_direction = "SSE"
                    end
                    if (avg_direction > 169 and avg_direction <= 191) 
                      wind_direction = "S"
                    end

            #--
                    if (avg_direction > 191 and avg_direction <= 214) 
                      wind_direction = "SSW"
                    end
                    if (avg_direction > 214 and avg_direction <= 236) 
                      wind_direction = "SW"
                    end
                    if (avg_direction > 236 and avg_direction <= 259) 
                      wind_direction = "WSW"
                    end
                    if (avg_direction > 259 and avg_direction <= 281) 
                      wind_direction = "W"
                    end
                    if (avg_direction > 281 and avg_direction <= 304) 
                      wind_direction = "WNW"
                    end
                    if (avg_direction > 304 and avg_direction <= 326) 
                      wind_direction = "NW"
                    end
                    if (avg_direction > 326 and avg_direction <= 349) 
                      wind_direction = "SSE"
                    end

                    @weather.wind_direction_degrees =  avg_direction.to_s 
                    @weather.wind_direction_compass =  wind_direction 
                
                #--  node - precipitation
                   parent_node = doc.root.xpath("//precipitation[@type='liquid']") 
                   children_named_name = parent_node.xpath(".//name") 
                   children_named_value = parent_node.xpath(".//value")
                    
                    count = 0
                    precip = 0
                    children_named_value.each do |ea|
                      count += 1
                      if count <= 4
                        
                        precip += ea.text.to_f 
                      end
                    end 
                    precip = (precip / 4)
                    @weather.precipitation =  "#{precip.to_s} in."

                 #--  node - Sky condition
                    parent_node = doc.root.xpath("//cloud-amount[@type='total']") 
                    children_named_name = parent_node.xpath(".//name") 
                    children_named_value = parent_node.xpath(".//value")
            
                    count = 0
                    cloud = 0
                    children_named_value.each do |ea|
                      count += 1
                      if count <= 4
                        cloud += ea.text.to_i
                      end
                    end 
                    cloud = (cloud / 8)
         
                     @weather.sky_condition =  "#{cloud}%"
                 
                  #--  node - Weather
                     parent_node = doc.root.xpath("//weather")
                     
                     parent_node = doc.root.xpath("//weather-conditions") 
                     children_named_value = parent_node.xpath(".//value")
         
                  
                     count = 0
                     children_named_value.each do |ea|
                       count += 1
                       if count <= 8
                        weather_chunk = ea.to_s.gsub('"', ' ') 
                        weather_chunk = weather_chunk.to_s.gsub(', ', '=') 
                        weather_chunk = weather_chunk.to_s.gsub('<value ', ' ')
                        weather_chunk = weather_chunk.to_s.gsub('qualifier= none >', ' ')
                        weather_chunk = weather_chunk.to_s.gsub('</value>', ' ')
                        weather_chunk = weather_chunk.to_s.gsub('<visibility xsi:nil= true />', ' ')
                    
                        if count == 1
                         @weather.weather_condition_1 =  weather_chunk 
                        elsif  count == 2
                          @weather.weather_condition_2 =  weather_chunk
                        elsif  count == 3
                          @weather.weather_condition_3 =  weather_chunk
                        elsif  count == 4
                          @weather.weather_condition_4 =  weather_chunk
                        elsif  count == 5
                          @weather.weather_condition_5 =  weather_chunk
                        elsif  count == 6
                          @weather.weather_condition_6 =  weather_chunk
                        elsif  count == 7
                          @weather.weather_condition_7 =  weather_chunk
                        elsif  count == 8
                          @weather.weather_condition_8 =  weather_chunk  
                        end
                       end
                     end
                 
                 
                     @weather.save
                 
            
                #--  node - Time layout 1
                    #--parent_nodes = doc.root.xpath("//time-layout")
                    #--parent_nodes.each do |parent_node|
                    #--if !parent_node.nil?
                      #--children_named_key = parent_node.xpath(".//layout-key") 
                      #--children_named_start = parent_node.xpath(".//start-valid-time") 
                      #--children_named_end = parent_node.xpath(".//end-valid-time")
                      #--children_named_key.each do |ea|
                       #--logger.debug "WEATHER TIME LAYOUT - #{ea.text}"
                      #--end
                       #--children_named_start.each do |ea|
                         #--logger.debug "Start - #{ea.text}"
                       #--end
                       #--children_named_end.each do |ea|
                         #--logger.debug "End - #{ea.text}"
                       #--end
                     #--end
                   #--end    
    
    
                #If you want to search on more complex criteria, you can also add in extra sauce to your xpath.

                  #noko = Nokogiri::XML("my_noko_file.xml")
                 # Searches your entire XML tree for an XML node type "MyNodeName" that has an attribute "id" set to a value of '1234'
                 # Then grabs the XML node of type "Something" from within the found NodeSet
                  #parent_node = noko.root.xpath("//MyNodeName[@id='1234']").at("Something")
                  # Grab all children of the "Something" node that are of type "Floyd"
                 # children_named_floyd = parent_node.xpath(".//Floyd"
          end
        end
   
  end
  


end
 