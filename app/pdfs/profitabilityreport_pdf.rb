class ProfitabilityreportPdf < Prawn::Document
  def initialize(user_id, view, farm_id, year, start_date, stop_date, report_version)
    @user_id = user_id
    super(top_margin: 30)
    @year = year
    @farm_id = farm_id
    @start_date = start_date
    @stop_date = stop_date
    @view = view 
    if !@farm_id.nil? and !@farm_id.blank?
      @farm = Farm.find(@farm_id)
      @farmname = @farm.farmname
      @total_acres = @farm.total_acres
    else
      @farmname = ""
      @total_acres = 0
    end
   
    
    @report_version = report_version
    
     
     
    if @report_version == "1"      #cost analysis
       
        profitability_header
    
        rowcount = 0
        table [["Operation/Task", "Hours/acre","Supply cost", "Labor cost", "Equipment cost", "Total cost"]],  
        :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 1, :size => 8, :text_color => "346842" } do
        
            row(0).font_style = :bold
            #row(rowcount).font_size = 10
            columns(0).width = 100
            columns(1..5).width = 70
            columns(0).align = :left
            columns(1..5).align = :right
        
            self.header = true
            rowcount += 1
          end
        
        @types = Farmjob.get_types_by_name("task_stage", @user_id)
     
        @types.each do |t|
           profitability_cost_items(@user_id, @view, @farm_id, @year, @start_date, @stop_date, t.type_value_string)
        end
    
         profitability_interest(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')
         profitability_operating_cost(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')
         profitability_cash_overhead(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '') 
         profitability_non_cash_overhead(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')    
         profitability_total_cost_summary(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')
           
    elsif @report_version == "2"    #profitability analysis
      
         @total_cost_acre = 0
         profitability_revenue_header
         
         rowcount = 0
         table [["","qty per acre" ,"Unit of measure" ,"Price/Cost per unit" ,"Value/Cost per acre"]],  
         :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 1, :size => 8, :text_color => "346842" } do

             row(0).font_style = :bold
             #row(rowcount).font_size = 10
             columns(0).width = 130
             columns(1).width = 60
             columns(1).width = 80
             columns(2).width = 80
             columns(3..4).width = 100
             columns(0).align = :left
             columns(1).align = :right
             columns(2).align = :left
             columns(3..4).align = :right

             self.header = true
             rowcount += 1
           end
           
         profitability_revenue(@user_id, @view, @farm_id, @year, @start_date, @stop_date)
         profitability_sales_expense(@user_id, @view, @farm_id, @year, @start_date, @stop_date)
         
         move_down 10
         text "<u>Supply costs per acre</u>", size: 8, style: :bold, :align => :left, :inline_format => true
         
         @types = Farmjob.get_types_by_name("task_stage", @user_id)
         
         @types.each do |t|
            profitability_supply_items(@user_id, @view, @farm_id, @year, @start_date, @stop_date, t.type_value_string)
         end
         profitability_supply_summary(@user_id, @view, @farm_id, @year, @start_date, @stop_date )
         
         move_down 10
         text "<u>Labor costs per acre</u>", size: 8, style: :bold, :align => :left, :inline_format => true
         
         @types.each do |t|
            profitability_labor_items(@user_id, @view, @farm_id, @year, @start_date, @stop_date, t.type_value_string)
         end
         profitability_labor_summary(@user_id, @view, @farm_id, @year, @start_date, @stop_date)
         
         move_down 10
         text "<u>Equipment costs per acre</u>", size: 8, style: :bold, :align => :left, :inline_format => true
         
         @types.each do |t|
            profitability_equipment_items(@user_id, @view, @farm_id, @year, @start_date, @stop_date, t.type_value_string)
         end
         profitability_equipment_summary(@user_id, @view, @farm_id, @year, @start_date, @stop_date)
      
         profitability_interest2(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')
         profitability_operating_cost2(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')
         profitability_cash_overhead2(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '') 
         profitability_non_cash_overhead2(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')
        
         
         move_down 20
         text "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", 
         size: 8, style: :bold, :align => :left, :inline_format => true
          move_down 20
         profitability_total_cost_acre(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')
         profitability_revenue_summary(@user_id, @view, @farm_id, @year, @start_date, @stop_date)
         profitability_net_position(@user_id, @view, @farm_id, @year, @start_date, @stop_date, '')
      
     elsif @report_version == "3"    #costs by month
       
     elsif @report_version == "4"    #range analysis
       
     elsif @report_version == "5"    #equipment cost
      
    end
  end
  
#-------------------------------------------------------------------------------------------------------------
  
  def profitability_header 
    fill_color "FF9900"
    text "iFarmService", size: 18, style: :normal, :align => :left, :color =>  [ "RED"]
    fill_color "404040"
  
    text "Cost Analysis Report", size: 12, style: :bold, :align => :center
    move_down 5
     text "Report Date - #{Date.today.to_s}", size: 8, style: :bold, :align => :center
    move_down 5
    text "Farm (#{@farmname})- total acres (#{@total_acres}) and Farm year (#{@year}) and Date Range  (#{@start_date} - #{@stop_date})", size: 8, style: :bold, :align => :center
    move_down 10
    text "(Costs per acre)", size: 8, style: :bold, :align => :center
    move_down 5
  end
  
  def profitability_revenue_header 
    fill_color "FF9900"
    text "iFarmService", size: 18, style: :normal, :align => :left
    fill_color "404040"
     
    text "Profitability Analysis", size: 12, style: :bold, :align => :center
    move_down 5
     text "Report Date - #{Date.today.to_s("%m-%d-%Y")}", size: 8, style: :bold, :align => :center

    move_down 5
    text "Farm (#{@farmname})- total acres (#{@total_acres}) and Farm year (#{@year}) and Date Range  (#{@start_date} - #{@stop_date})", size: 8, style: :bold, :align => :center
    move_down 10
    text "(Revenue and Costs per acre with profitability)", size: 8, style: :bold, :align => :center
    move_down 5
  end
  
  def profitability_cost_stage_header(task_stage)
    move_down 10
    text " #{task_stage}", size: 7, style: :bold, :align => :left
  end
  #-------Cost items  ------------------------------------------------------------------------------
  
  def profitability_cost_items(user_id, view, farm_id, year, start_date, stop_date, task_stage)
     
    move_down 5
    rowcount = 0
    profitability_cost_stage_header(task_stage)
    table profitability_item_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :normal
      row(0).height = 0
      columns(0).width = 100
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    
     profitability_item_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    
    
  end
  
  def profitability_item_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    [["","" ,"" ,"" ,"" ,""]] +
    Farmjob.profitability_cost_items(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [item.taskdescription, precision(item.total_hours_acre), cost(item.supply_cost_acre), cost(item.labor_cost_acre), cost(item.equipment_cost_acre), cost(item.total_cost_acre)]
       end      


  end
  #---------Cost item summary ----------------------------------------------------------------------------
  
  def profitability_item_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)

    rowcount = 0
    table profitability_cost_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
      columns(0).width = 100
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
      
      self.header = false
      rowcount += 1
    end
    
  end
  
  def profitability_cost_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    @task_stage = task_stage
   
    Farmjob.profitability_cost_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
      [@task_stage + ' Total', precision(item.total_hours_acre), cost(item.supply_cost_acre), 
        cost(item.labor_cost_acre), cost(item.equipment_cost_acre), cost(item.total_cost_acre)]
    end
  end
  
  #---------Revenue per acre ----------------------------------------------------------------------------
  
  def profitability_revenue(user_id, view, farm_id, year, start_date, stop_date)
    move_down 5
    text "<u>Revenue per acre</u>", size: 8, style: :bold, :align => :left, :inline_format => true
    rowcount = 0
    table profitability_revenue_rows(user_id, view, farm_id, year, start_date, stop_date), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :normal
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
      

      
      self.header = false
      rowcount += 1
    end
    
    profitability_revenue_summary(user_id, view, farm_id, year, start_date, stop_date)
    
  end
  
  
  def profitability_revenue_rows(user_id, view, farm_id, year, start_date, stop_date)
    [[" " ," " ," " ," ", " "]] +
    Shipment.profitability_revenue(user_id, view, farm_id, year, start_date, stop_date).map do |item|
         [item.cropplanfull, precision(item.qty_per_acre), item.qty_uom, cost(item.price_per_unit), cost(item.value_per_acre)]
       end      


  end
  
  #-------revenue summary----------
  def profitability_revenue_summary(user_id, view, farm_id, year, start_date, stop_date)

    rowcount = 0
    table profitability_revenue_summary_rows(user_id, view, farm_id, year, start_date, stop_date), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :bold
      columns(0).size = 9
      columns(4).font_style = :bold
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
      

      
      self.header = false
      rowcount += 1
    end
    
    
  end
  
  
  def profitability_revenue_summary_rows(user_id, view, farm_id, year, start_date, stop_date)
    [[" " ," " ," " ," ", " "]] +
    Shipment.profitability_revenue_summary(user_id, view, farm_id, year, start_date, stop_date).map do |item|
         ["Total Revenue/acre", precision(item.qty_per_acre),  " ", cost(item.price_per_unit), cost(item.value_per_acre)]
       end      


  end
  
  #---------Commission per acre ----------------------------------------------------------------------------
  
  def profitability_sales_expense(user_id, view, farm_id, year, start_date, stop_date)
    move_down 5
    text "<u>Sales commission per acre</u>", size: 8, style: :bold, :align => :left, :inline_format => true
    rowcount = 0
    table profitability_sales_expense_rows(user_id, view, farm_id, year, start_date, stop_date), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :normal
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
      

      
      self.header = false
      rowcount += 1
    end
    
    profitability_sales_expense_summary(user_id, view, farm_id, year, start_date, stop_date)
    
  end
  
  
  def profitability_sales_expense_rows(user_id, view, farm_id, year, start_date, stop_date)
    [[" " ," " ," " ," ", " "]] +
    Shipment.profitability_sales_expense(user_id, view, farm_id, year, start_date, stop_date).map do |item|
         [item.cropplanfull, precision(item.qty_per_acre), '', cost(item.price_per_unit), cost(item.value_per_acre)]
       end      


  end
  
  #-------revenue summary----------
  def profitability_sales_expense_summary(user_id, view, farm_id, year, start_date, stop_date)

    rowcount = 0
    table profitability_sales_expense_summary_rows(user_id, view, farm_id, year, start_date, stop_date), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :bold
      columns(0).size = 9
      columns(4).font_style = :bold
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
      

      
      self.header = false
      rowcount += 1
    end
    
    
  end
  
  
  def profitability_sales_expense_summary_rows(user_id, view, farm_id, year, start_date, stop_date)
    [[" " ," " ," " ," ", " "]] +
    Shipment.profitability_sales_expense_summary(user_id, view, farm_id, year, start_date, stop_date).map do |item|
         ["Total Commission/acre", precision(item.qty_per_acre),  " ", cost(item.price_per_unit), cost(item.value_per_acre)]
       end      


  end
  #--------Supply costs itemized ------------------------------------------------------------------------------
  def profitability_supply_items(user_id, view, farm_id, year, start_date, stop_date, task_stage)

    rowcount = 0
    profitability_cost_stage_header(task_stage)
   

    table profitability_supply_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :normal
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    
    
  end
  def profitability_supply_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    [["" ,"" ,"" ,"", ""]] +
    Farmjobsupply.profitability_supply_items(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [item.supplyname, precision(item.qty_per_acre), item.usage_uom, cost(item.cost_per_unit), cost(item.cost_per_acre)]
       end    


  end
  
  #-------supply cost summary----------
  def profitability_supply_summary(user_id, view, farm_id, year, start_date, stop_date)

    rowcount = 0
    table profitability_supply_summary_rows(user_id, view, farm_id, year, start_date, stop_date), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :bold
      columns(4).font_style = :bold
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
      

      
      self.header = false
      rowcount += 1
    end
    
    
  end
  
  
  def profitability_supply_summary_rows(user_id, view, farm_id, year, start_date, stop_date)
    [[" " ," " ," " ," ", " "]] +
    Farmjobsupply.profitability_supply_summary(user_id, view, farm_id, year, start_date, stop_date).map do |item|
         ["Total Supply cost/acre", " ",  " ", " ", cost(item.cost_per_acre)]
       end      


  end
  
  #--------Labor costs itemized ------------------------------------------------------------------------------
  def profitability_labor_items(user_id, view, farm_id, year, start_date, stop_date, task_stage)

    rowcount = 0
    profitability_cost_stage_header(task_stage)
   

    table profitability_labor_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :normal
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    
    
  end
  def profitability_labor_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    [["" ,"" ,"" ,"", ""]] +
    Farmjoblabor.profitability_labor_items(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [item.partyname + '-' + item.partyjobtitle, precision(item.qty_per_acre), 'hours', cost(item.cost_per_unit), cost(item.cost_per_acre)]
       end    


  end
  
  #-------labor cost summary----------
  def profitability_labor_summary(user_id, view, farm_id, year, start_date, stop_date)

    rowcount = 0
    table profitability_labor_summary_rows(user_id, view, farm_id, year, start_date, stop_date), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :bold
      columns(4).font_style = :bold
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
      

      
      self.header = false
      rowcount += 1
    end
    
    
  end
  
  
  def profitability_labor_summary_rows(user_id, view, farm_id, year, start_date, stop_date)
    [[" " ," " ," " ," ", " "]] +
    Farmjoblabor.profitability_labor_summary(user_id, view, farm_id, year, start_date, stop_date).map do |item|
         ["Total Labor cost/acre", " ",  " ", " ", cost(item.cost_per_acre)]
       end      


  end
  
  #------Equipment costs itemized ------------------------------------------------------------------------------
  def profitability_equipment_items(user_id, view, farm_id, year, start_date, stop_date, task_stage)

    rowcount = 0
    profitability_cost_stage_header(task_stage)
   

    table profitability_equipment_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :normal
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    
    
  end
  def profitability_equipment_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    [["" ,"" ,"" ,"", ""]] +
    Farmjobequipment.profitability_equipment_items(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [item.description + '-' + item.make + '-' + item.model + '-' + item.year, precision(item.qty_per_acre), 'hours', cost(item.cost_per_unit), cost(item.cost_per_acre)]
       end    


  end
  
  #-------equipment cost summary----------
  def profitability_equipment_summary(user_id, view, farm_id, year, start_date, stop_date)

    rowcount = 0
    table profitability_equipment_summary_rows(user_id, view, farm_id, year, start_date, stop_date), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
      row(0).height = 0
      columns(0).font_style = :bold
      columns(4).font_style = :bold
      columns(0).width = 130
      columns(1).width = 80
      columns(2).width = 80
      columns(3..4).width = 100
      columns(0).align = :left
      columns(1).align = :right
      columns(2).align = :left
      columns(3..4).align = :right
      

      
      self.header = false
      rowcount += 1
    end
    
    
  end
  
  
  def profitability_equipment_summary_rows(user_id, view, farm_id, year, start_date, stop_date)
    [[" " ," " ," " ," ", " "]] +
    Farmjobequipment.profitability_equipment_summary(user_id, view, farm_id, year, start_date, stop_date).map do |item|
         ["Total Equipment cost/acre", " ",  " ", " ", cost(item.cost_per_acre)]
       end      


  end
  #--------Interest on operating capital - cost summary-----------------------------------------------------------------------------
  
  def profitability_interest(user_id, view, farm_id, year, start_date, stop_date, task_stage)
     
    move_down 10

    rowcount = 0

    table profitability_interest_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :normal 
      row(0).height = 0
      columns(0).width = 100
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    
    # profitability_operating_cost_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    
  end
  def profitability_interest_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    
       @interest_expense = Farmjob.profitability_interest_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)

       [["","" ,"" ,"" ,"" ,""]] +
       Farmjob.profitability_interest(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [ item.expense_name,'','','','', cost(item.expense_amount_acre)]
       end      


  end

  #------Total operating cost-----------------------------------------------------------------------------
 
  def profitability_operating_cost(user_id, view, farm_id, year, start_date, stop_date, task_stage)
     
    move_down 10

 
    rowcount = 0

    table profitability_operating_cost_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
 
      row(rowcount).size = 8
      columns(0).width = 100
      columns(0).font_style = :bold
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    

  end
  def profitability_operating_cost_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
 
    Farmjob.profitability_operating_cost(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
      ['Total Operating Cost /acre',' ', cost(item.supply_cost_acre), 
        cost(item.labor_cost_acre), cost(item.equipment_cost_acre), cost(item.total_cost_acre)]  
    end

  end
  
 
  #-----Cash overhead -------------------------------------------------------------------------------------------
  def profitability_cash_overhead(user_id, view, farm_id, year, start_date, stop_date, task_stage)
     
    move_down 20
    text "Cash Ovehead", size: 8, style: :bold, :align => :left
    rowcount = 0

    table profitability_cash_overhead_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
 
      #row(rowcount).font_size = 10
      columns(0).width = 100
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
     
    
      self.header = false
      rowcount += 1
    end
     
    profitability_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
  
  end
  def profitability_cash_overhead_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    
       Farmjob.profitability_cash_overhead(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [ item.expense_name,'','','','', cost(item.expense_amount_acre)]
       end      


  end
  
  def profitability_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
     

    rowcount = 0

    table profitability_cash_overhead_summary_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
 
      #row(rowcount).font_size = 10
      columns(0).width = 100
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    
  
  end
  def profitability_cash_overhead_summary_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    
       Farmjob.profitability_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [ 'Total Cash Overhead','','','','', cost(item.expense_amount_acre)]
       end      


  end
  #-------non cash overhead --------------------------------------------------------------------
  def profitability_non_cash_overhead(user_id, view, farm_id, year, start_date, stop_date, task_stage)
     
     move_down 20
     text "Non Cash Ovehead", size: 8, style: :bold, :align => :left
    rowcount = 0

    table profitability_non_cash_overhead_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
 
      #row(rowcount).font_size = 10
      columns(0).width = 100
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    
    profitability_non_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
  
  end
  def profitability_non_cash_overhead_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    
       Farmjob.profitability_non_cash_overhead(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [ item.expense_name,'','','','', cost(item.expense_amount_acre)]
       end      


  end
  def profitability_non_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
     

    rowcount = 0

    table profitability_non_cash_overhead_summary_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
 
      #row(rowcount).font_size = 10
      columns(0).width = 100
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    
  
  end
  def profitability_non_cash_overhead_summary_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
    
       Farmjob.profitability_non_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
         [ 'Total Non Cash Overhead','','','','', cost(item.expense_amount_acre)]
       end      


  end
  

  
  #-------Total cost per acre-------------------------------------------------------------------
 
  def profitability_total_cost_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
     
    move_down 20

 
    rowcount = 0

    table profitability_total_cost_summary_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
 
      row(rowcount).size = 8
      columns(0).width = 100
      columns(0).font_style = :bold
      columns(1..5).width = 70
      columns(0).align = :left
      columns(1..5).align = :right
     
    
      self.header = false
      rowcount += 1
    end
    

  end
  def profitability_total_cost_summary_rows(user_id, view, farm_id, year, start_date, stop_date, task_stage)
 
    Farmjob.profitability_total_cost_acre(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
      ['Total Cost /acre',' ', ' ', 
        ' ', ' ', cost(item.total_cost_acre)]  
    end

  end
  
  #--------Interest on operating capital - cost summary-----------------------------------------------------------------------------

   def profitability_interest2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

     move_down 10

     rowcount = 0

     table profitability_interest_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
       row(0).height = 0
       columns(0).font_style = :bold
       columns(4).font_style = :bold
       columns(0).width = 130
       columns(1).width = 80
       columns(2).width = 80
       columns(3..4).width = 100
       columns(0).align = :left
       columns(1).align = :right
       columns(2).align = :left
       columns(3..4).align = :right


       self.header = false
       rowcount += 1
     end

     # profitability_operating_cost_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)

   end
   def profitability_interest_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

        @interest_expense = Farmjob.profitability_interest_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)

        [["","" ,"" ,"" ,""]] +
        Farmjob.profitability_interest(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
          [ item.expense_name,'','','', cost(item.expense_amount_acre)]
        end      


   end

   #------Total operating cost-----------------------------------------------------------------------------

   def profitability_operating_cost2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

     move_down 10


     rowcount = 0

     table profitability_operating_cost_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
       row(0).font_style = :bold

       #row(0).height = 0
       columns(0).font_style = :bold
       columns(4).font_style = :bold
       columns(0).width = 130
       columns(1).width = 80
       columns(2).width = 80
       columns(3..4).width = 100
       columns(0).align = :left
       columns(1).align = :right
       columns(2).align = :left
       columns(3..4).align = :right


       self.header = false
       rowcount += 1
     end


   end
   def profitability_operating_cost_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

     Farmjob.profitability_operating_cost(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
       ['Total Operating Cost /acre', ' ', ' ', ' ', cost(item.total_cost_acre)]  
     
     end
    

   end


   #-----Cash overhead -------------------------------------------------------------------------------------------
   def profitability_cash_overhead2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

     move_down 20
     text "Cash Ovehead", size: 8, style: :bold, :align => :left
     rowcount = 0

     table profitability_cash_overhead_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
       row(0).font_style = :bold

       #row(0).height = 0
       columns(0).font_style = :bold
       columns(4).font_style = :bold
       columns(0).width = 130
       columns(1).width = 80
       columns(2).width = 80
       columns(3..4).width = 100
       columns(0).align = :left
       columns(1).align = :right
       columns(2).align = :left
       columns(3..4).align = :right


       self.header = false
       rowcount += 1
     end

     profitability_cash_overhead_summary2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

   end
   def profitability_cash_overhead_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

        Farmjob.profitability_cash_overhead(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
          [ item.expense_name,'','','', cost(item.expense_amount_acre)]
        end      


   end

   def profitability_cash_overhead_summary2(user_id, view, farm_id, year, start_date, stop_date, task_stage)


     rowcount = 0

     table profitability_cash_overhead_summary_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
       row(0).font_style = :bold

       #row(0).height = 0
       columns(0).font_style = :bold
       columns(4).font_style = :bold
       columns(0).width = 130
       columns(1).width = 80
       columns(2).width = 80
       columns(3..4).width = 100
       columns(0).align = :left
       columns(1).align = :right
       columns(2).align = :left
       columns(3..4).align = :right


       self.header = false
       rowcount += 1
     end


   end
   def profitability_cash_overhead_summary_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

        Farmjob.profitability_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
          [ 'Total Cash Overhead','','','', cost(item.expense_amount_acre)]
           
        end      


   end
   #-------non cash overhead --------------------------------------------------------------------
   def profitability_non_cash_overhead2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

      move_down 20
      text "Non Cash Ovehead", size: 8, style: :bold, :align => :left
     rowcount = 0

     table profitability_non_cash_overhead_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
       row(0).font_style = :bold

       #row(0).height = 0
       columns(0).font_style = :bold
       columns(4).font_style = :bold
       columns(0).width = 130
       columns(1).width = 80
       columns(2).width = 80
       columns(3..4).width = 100
       columns(0).align = :left
       columns(1).align = :right
       columns(2).align = :left
       columns(3..4).align = :right


       self.header = false
       rowcount += 1
     end

     profitability_non_cash_overhead_summary2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

   end
   def profitability_non_cash_overhead_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage)

        Farmjob.profitability_non_cash_overhead(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
          [ item.expense_name,'','','', cost(item.expense_amount_acre)]
        end      


   end
   def profitability_non_cash_overhead_summary2(user_id, view, farm_id, year, start_date, stop_date, task_stage)


     rowcount = 0

     table profitability_non_cash_overhead_summary_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage ), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
       row(0).font_style = :bold

       #row(0).height = 0
       columns(0).font_style = :bold
       columns(4).font_style = :bold
       columns(0).width = 130
       columns(1).width = 80
       columns(2).width = 80
       columns(3..4).width = 100
       columns(0).align = :left
       columns(1).align = :right
       columns(2).align = :left
       columns(3..4).align = :right


       self.header = false
       rowcount += 1
     end


   end
   def profitability_non_cash_overhead_summary_rows2(user_id, view, farm_id, year, start_date, stop_date, task_stage )

        Farmjob.profitability_non_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
          [ 'Total Non Cash Overhead','','','', cost(item.expense_amount_acre)]
         
        end      


   end
   
    def profitability_total_cost_acre(user_id, view, farm_id, year, start_date, stop_date, task_stage)


      rowcount = 0

      table profitability_total_cost_acre_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
        row(0).font_style = :bold

        #row(0).height = 0
        columns(0).font_style = :bold
        columns(0).size = 9
        columns(4).font_style = :bold
        columns(0).width = 130
        columns(1).width = 80
        columns(2).width = 80
        columns(3..4).width = 100
        columns(0).align = :left
        columns(1).align = :right
        columns(2).align = :left
        columns(3..4).align = :right


        self.header = false
        rowcount += 1
      end

    end
    def profitability_total_cost_acre_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)

         Farmjob.profitability_total_cost_acre(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
           [ 'Total Cost Per Acre','','','', cost(item.total_cost_acre)]
         end      


    end
    
    def profitability_net_position(user_id, view, farm_id, year, start_date, stop_date, task_stage)


      rowcount = 0

      table profitability_net_position_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage), :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
        row(0).font_style = :bold

        #row(0).height = 0
        columns(0).font_style = :bold
        columns(0).size = 9
        columns(4).font_style = :bold
        columns(0).width = 130
        columns(1).width = 80
        columns(2).width = 80
        columns(3..4).width = 100
        columns(0).align = :left
        columns(1).align = :right
        columns(2).align = :left
        columns(3..4).align = :right


        self.header = false
        rowcount += 1
      end

    end
    def profitability_net_position_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)

         Farmjob.profitability_net_position(user_id, view, farm_id, year, start_date, stop_date, task_stage).map do |item|
           [ 'Net Returns Above Cost','','','', cost(item.value_per_acre)]
         end      

    end
    
  
  #-------------------------------------------------------------------------------------------------------------
  
  def cost(num)
    @view.number_to_currency(num, :precision => 2)
  end
  
  def precision(num)
    @view.number_with_precision(num, :precision => 2)
  end

end