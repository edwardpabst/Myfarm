class Fieldmapping < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :field_id, :shape_id, :shape_description, :user_id, :latitude, :longitude 
  
  belongs_to :field

  def self.get_fieldmapping_by_field(field)
    return Fieldmapping.find_by_sql("Select * from fieldmappings 
    where fieldmappings.field_id = #{field} 
    order by fieldmappings.id")
  end

  def self.setnewmapping(user_id,field_id,coor1,coor2,coor3,coor4,coor5,coor6)
    #clear previous mapping
    @fieldmapping = Fieldmapping.find_all_by_field_id(field_id)
    if !@fieldmapping.nil?
      @fieldmapping.each do |fm|
        @fm = Fieldmapping.find(fm.id)
        @fm.destroy
      end
    end  
 
    # load arrays from new coordinates
      c1 = []
      c2 = []
      c3 = []
      c4 = []
      c5 = []
      c6 = []
      coordinate = []
      
      c1 = coor1.split(',')
      c2 = coor2.split(',')
      c3 = coor3.split(',')
      c4 = coor4.split(',')
      c5 = coor5.split(',')
      c6 = coor6.split(',')
  #---------- define first shape ------------    
      @count = 1
     
     
      if c1.length > 0
        c1.each do |i|
          if i != ''
            if @count == 1
              # set latitude
              @fieldmapping = Fieldmapping.new
              @fieldmapping.field_id = field_id
              @fieldmapping.user_id = user_id
              @fieldmapping.shape_id = 1
              @fieldmapping.shape_description = '' 
              i.slice!(0)  
              @fieldmapping.latitude = i
              
              @count = 2
              
            elsif @count == 2
              #set longitude
              length = i.length
              i.slice!(length -1)
              @fieldmapping.longitude = i
              @fieldmapping.save
              @count = 1
            end
          end
        end
      end 
      
      #---------- define second shape ------------    
          @count = 1
          if c2.length > 0
            c2.each do |i|
              if i != ''
                if @count == 1
                  # set latitude
                  @fieldmapping = Fieldmapping.new
                  @fieldmapping.field_id = field_id
                  @fieldmapping.user_id = user_id
                  @fieldmapping.shape_id = 2
                  @fieldmapping.shape_description = ''
                  i.slice!(0)  
                  @fieldmapping.latitude = i

                  @count = 2

                elsif @count == 2
                  #set longitude
                  i.slice!(length -1)
                  @fieldmapping.longitude = i
                  @fieldmapping.save
                  @count = 1
                end
              end
            end
          end
          
          #---------- define third shape ------------    
              @count = 1
              if c3.length > 0
                c3.each do |i|
                  if i != ''
                    if @count == 1
                      # set latitude
                      @fieldmapping = Fieldmapping.new
                      @fieldmapping.field_id = field_id
                      @fieldmapping.user_id = user_id
                      @fieldmapping.shape_id = 3
                      @fieldmapping.shape_description = ''
                      i.slice!(0)  
                      @fieldmapping.latitude = i

                      @count = 2

                    elsif @count == 2
                      #set longitude
                      i.slice!(length -1)
                      @fieldmapping.longitude = i
                      @fieldmapping.save
                      @count = 1
                    end
                  end
                end
              end
              #---------- define fourth shape ------------    
                  @count = 1
                  if c4.length > 0
                    c4.each do |i|
                      if i != ''
                        if @count == 1
                          # set latitude
                          @fieldmapping = Fieldmapping.new
                          @fieldmapping.field_id = field_id
                          @fieldmapping.user_id = user_id
                          @fieldmapping.shape_id = 4
                          @fieldmapping.shape_description = ''
                          i.slice!(0)  
                          @fieldmapping.latitude = i

                          @count = 2

                        elsif @count == 2
                          #set longitude
                          i.slice!(length -1)
                          @fieldmapping.longitude = i
                          @fieldmapping.save
                          @count = 1
                        end
                      end
                    end
                  end
                  #---------- define fifth shape ------------    
                      @count = 1
                      if c5.length > 0
                        c5.each do |i|
                          if i != ''
                            if @count == 1
                              # set latitude
                              @fieldmapping = Fieldmapping.new
                              @fieldmapping.field_id = field_id
                              @fieldmapping.user_id = user_id
                              @fieldmapping.shape_id = 5
                              @fieldmapping.shape_description = ''
                              i.slice!(0)  
                              @fieldmapping.latitude = i

                              @count = 2

                            elsif @count == 2
                              #set longitude
                              i.slice!(length -1)
                              @fieldmapping.longitude = i
                              @fieldmapping.save
                              @count = 1
                            end
                          end
                        end
                      end
                      #---------- define sixth shape ------------    
                          @count = 1
                          if c6.length > 0
                            c6.each do |i|
                              if i != ''
                                if @count == 1
                                  # set latitude
                                  @fieldmapping = Fieldmapping.new
                                  @fieldmapping.field_id = field_id
                                  @fieldmapping.user_id = user_id
                                  @fieldmapping.shape_id = 6
                                  @fieldmapping.shape_description = ''
                                  i.slice!(0)  
                                  @fieldmapping.latitude = i

                                  @count = 2

                                elsif @count == 2
                                  #set longitude
                                  i.slice!(length -1)
                                  @fieldmapping.longitude = i
                                  @fieldmapping.save
                                  @count = 1
                                end
                              end
                            end
                          end
  end #--- end of method
  
  
end   #--- end of class
