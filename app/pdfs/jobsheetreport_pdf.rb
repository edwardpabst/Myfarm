class JobsheetreportPdf < Prawn::Document
  def initialize(user_id, view, farmjob_id)
    @user_id = user_id
    super(top_margin: 30)
    @farmjob_id = farmjob_id
    @view = view 
    jobsheet_header
    #invoice_items
  end
  
  def jobsheet_header
    
    
    @farmjob_complete = Farmjob.get_complete_job_data(@farmjob_id)
 
      # actual
      #----------     
      # hours
      # acres
      # growth stage
      # soil condition
      # soil type
      # day segment
      # wind direction
      # wind speed
      # humidity
      # sky condition
      # notes
      
      #supplies
      #labor
      #equipment
      
      # wind direction
      #Heading
      fill_color "FF9900"
      draw_text "by iFarmService", size: 8, style: :normal, 
                              :at => [470, 720]
      fill_color "404040"
      
      draw_text "Job Sheet", size: 12, style: :bold,    
                              :at => [230, 720]
      
      #line 1
      draw_text  "Job Date ", size: 9, style: :bold, 
                              :at => [10, 690] 
      draw_text  "#{@farmjob_complete.start_date.to_formatted_s(:long)}", size: 9, style: :normal,  
                              :at => [10, 670]                 
      draw_text  "Field task ", size: 9, style: :bold,  
                              :at => [100, 690] 
      draw_text  "#{@farmjob_complete.taskdescription}", size: 9, style: :normal,  
                              :at => [100, 670]
      draw_text  "Farm ", size: 9, style: :bold,  
                              :at => [210, 690] 
      draw_text  "#{@farmjob_complete.farmname}", size: 9, style: :normal,  
                              :at => [210, 670]
      draw_text  "Field ", size: 9, style: :bold,  
                              :at => [320, 690] 
      draw_text  "#{@farmjob_complete.fieldname}", size: 9, style: :normal,  
                              :at => [320, 670]                                                                
      draw_text  "Crop ", size: 9, style: :bold,  
                              :at => [430, 690] 
      draw_text  "#{@farmjob_complete.cropplanfull}", size: 9, style: :normal,  
                              :at => [430, 670]
      
      # line 2
      draw_text  "Job Status ", size: 9, style: :bold, 
                              :at => [10, 630] 
      draw_text  "#{@farmjob_complete.job_status}", size: 9, style: :normal,  
                              :at => [10, 610]                 
      draw_text  "Area Size ", size: 9, style: :bold,  
                              :at => [100, 630] 
      draw_text  "#{@farmjob_complete.area_size}", size: 9, style: :normal,  
                              :at => [100, 610]
      draw_text  "Estimated hours ", size: 9, style: :bold,  
                              :at => [210, 630] 
      draw_text  "#{@farmjob_complete.total_hours}", size: 9, style: :normal,  
                              :at => [210, 610]
     
     
      # line notes
      draw_text  "Task notes ", size: 9, style: :bold, 
                              :at => [10, 570] 
      draw_text  "#{@farmjob_complete.notes}", size: 9, style: :normal,
                              :at => [10, 550]
      draw_text  "______________________________________________________________________________________________________________", 
                              size: 9, style: :bold, 
                              :at => [10, 540]
      
      # lines for actual entry
      draw_text  "Actual Hours ", size: 9, style: :bold, 
                              :at => [10, 510] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                            :at => [80, 510]  
      draw_text  "Area Worked ", size: 9, style: :bold, 
                              :at => [10, 480] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                              :at => [80, 480] 
      draw_text  "Growth Stage ", size: 9, style: :bold, 
                              :at => [10, 450] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                              :at => [80, 450]                                       
      
      draw_text  "Day Segment ", size: 9, style: :bold, 
                              :at => [10, 420] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                              :at => [80, 420]                              
      draw_text  "Wind Speed ", size: 9, style: :bold, 
                              :at => [10, 390] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                            :at => [80, 390]  
      draw_text  "Wind Direction ", size: 9, style: :bold, 
                              :at => [10, 360] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                              :at => [80, 360] 
      draw_text  "Soil Type ", size: 9, style: :bold, 
                              :at => [10, 330] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                              :at => [80, 330]                                       

      draw_text  "Soil Condition ", size: 9, style: :bold, 
                              :at => [10, 300] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                              :at => [80, 300]  
                              
      draw_text  "Humidity ", size: 9, style: :bold, 
                              :at => [10, 270] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                              :at => [80, 270]                                       

      draw_text  "Sky Condition ", size: 9, style: :bold, 
                              :at => [10, 240] 
      draw_text  "  ________________________________", size: 10, style: :normal,  
                              :at => [80, 240] 
      
      draw_text  "Notes ", size: 9, style: :bold, 
                              :at => [10, 210] 
      draw_text  "  ________________________________________________________________________________", size: 10, style: :normal,  
                              :at => [80, 210]  
      draw_text  "  ________________________________________________________________________________", size: 10, style: :normal,  
                              :at => [80, 180] 
      draw_text  "______________________________________________________________________________________________________________", 
                              size: 9, style: :bold, 
                              :at => [10, 165]      
      
      draw_text  "Supplies Used", size: 9, style: :bold, 
                              :at => [10, 140]  
      draw_text  "Qty", size: 9, style: :bold, 
                              :at => [120, 140] 
      draw_text  "Labor Used", size: 9, style: :bold, 
                              :at => [180, 140]  
      draw_text  "Hours", size: 9, style: :bold, 
                              :at => [290, 140]
      draw_text  "Equipment Used", size: 9, style: :bold, 
                              :at => [370, 140]  
      draw_text  "Hours", size: 9, style: :bold, 
                              :at => [480, 140]                                                      
      
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [10, 120]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [120, 120] 
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [180, 120]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [290, 120]
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [370, 120]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [480, 120]


      
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [10, 100]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [120, 100] 
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [180, 100]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [290, 100]
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [370, 100]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [480, 100]
                              
                              
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [10, 80]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [120, 80] 
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [180, 80]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [290, 80]
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [370, 80]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [480, 80]  
                              
      
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [10, 60]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [120, 60] 
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [180, 60]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [290, 60]
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [370, 60]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [480, 60] 
                              
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [10, 40]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [120, 40] 
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [180, 40]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [290, 40]
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [370, 40]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [480, 40] 
                              
                              
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [10, 20]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [120, 20] 
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [180, 20]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [290, 20]
      draw_text  "____________________", size: 9, style: :bold, 
                              :at => [370, 20]  
      draw_text  "______", size: 9, style: :bold, 
                              :at => [480, 20]  
      #fill_color "A7C6D6"
      #font("Helvetica") do
        #text "#{inv.billname}", size: 20, style: :italic, :align => :left
      #end
      #fill_color "404040"

         

  end
  
  
  def cost(num)
    @view.number_to_currency(num)
  end
  
end
