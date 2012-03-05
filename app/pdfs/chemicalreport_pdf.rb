class ChemicalreportPdf < Prawn::Document
  def initialize(user_id, view, supply_id, job_status, start_date, stop_date)
    @user_id = user_id
    super(top_margin: 30)
    @supply_id, = supply_id
    @job_status = job_status
    @start_date = start_date
    @stop_date = stop_date
    @view = view 
    if !@supply_id.nil? and !@supply_id.blank?
      @supply = Supply.find(supply_id)
      @supplyname = @supply.supplyname
    else
      @supplyname = ""
    end
 
     chemical_header

       
       if @supply_id.nil? || @supply_id.blank?
 
         @supplylist = Supply.get_supply_for_chemical(@user_id, @job_status, @start_date, @stop_date)
 
         
         @supplylist.each do |t|
           text "  Chemical - (#{t.supplyname}) Active ingredient - (#{t.active_ingredient}) Formulation - (#{t.formulation}) Restricted hours - (#{t.restricted_hours}) ", 
           size: 7, style: :bold, :align => :left 
           move_down 2
           supply_items(t.id)
     
          supply_summary(@user_id, t.id, @job_status, @start_date, @stop_date )
          move_down 5
         end
         

     
       else

         @supplylist = supply.get_supply_for_chemical(@user_id, @job_status, @start_date, @stop_date)
         
         @supplylist.each do |t|
           text "  Chemical - (#{t.supplyname}) Active ingredient - (#{t.active_ingredient}) Formulation - (#{t.formulation}) Restricted hours - (#{t.restricted_hours}) ", 
           size: 7, style: :bold, :align => :left 
           move_down 2
          supply_items(t.id)
          supply_summary(@user_id, t.id, @job_status, @start_date, @stop_date )
          move_down 5
         end
          
        end
  

  end

  
  def chemical_header
    #repeat :all do
           
        text "Restricted Use Chemical Usage Report", size: 14, style: :bold, :align => :center 
        move_down 5

        text "for Chemical - (#{@supplyname})  / Job status - (#{@job_status})", size: 8, style: :bold, :align => :center
        move_down 5
        text "for Date Range - (#{@start_date} - #{@stop_date})", size: 8, style: :bold, :align => :center
        move_down 5
        rowcount = 0

        
       table [["Crop",  "Field", "Area size", "App Date", "Qty /acre", "UOM", "Total usage", "Carr rate", "UOM", "Carr usage",  "Weather", "Wind", "Temperature"]] ,
        :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 1, :size => 7, :text_color => "346842" } do

            row(0).font_style = :bold
            #row(rowcount).font_size = 10
            columns(0).width = 45
            columns(1).width = 45
            columns(2).width = 35
            columns(3).width = 45
            columns(4).width = 35
            columns(5).width = 40
            columns(6).width = 45
            columns(7..13).width = 35

            columns(0..3).align = :left
             columns(4..10).align = :right
            columns(11..13).align = :left


            self.header = true
            rowcount += 1
          end
          move_down 5
  end
  
  def supply_items(id)
    
    rowcount = 0
    table supply_item_rows(id), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 7, :text_color => "346842" } do  
      #row(0).font_style = :bold
      #row(0).border_width = 1 
      columns(0).width = 45
      columns(1).width = 45
      columns(2).width = 35
      columns(3).width = 45
      columns(4).width = 35
      columns(5).width = 40
      columns(6).width = 45
      columns(7..13).width = 35

      columns(0..3).align = :left
       columns(4..10).align = :right
      columns(11..13).align = :left
      
      self.header = true
      rowcount += 1
    end
   
  end

  def supply_item_rows(id)
   Supply.supply_chemical_items(@user_id, id, @job_status,  @start_date, @stop_date).map do |item|
      [item.cropplanfull, item.fieldname, item.applied_area, item.start_date.to_date, precision0(item.rate_acre), item.distribution_uom, precision0(item.chemical_usage), ] +
      [precision0(item.carrier_rate_acre), precision0(item.carrier_uom), precision0(item.carrier_usage),precision0(item.sky_condition), precision0(item.wind_speed), precision0(item.temperature)]
    end
  end
  
  def supply_summary(user_id, id, job_status, start_date, stop_date)

    rowcount = 0
    table supply_chemical_summary(user_id, id, job_status, start_date, stop_date), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
      column(0..1)..font_style = :bold
      
      columns(0).width = 45
      columns(1).width = 45
      columns(2).width = 35
      columns(3).width = 45
      columns(4).width = 35
      columns(5).width = 40
      columns(6).width = 45
      columns(7..13).width = 35

      columns(0..3).align = :left
       columns(4..10).align = :right
      columns(11..13).align = :left

      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def supply_chemical_summary(user_id, id, job_status, start_date, stop_date)
    
    Supply.supply_chemical_summary(@user_id, id, @job_status, @start_date, @stop_date).map do |item|
      ["Total", "", precision0(item.applied_area), " ", " ", " ",precision0(item.chemical_usage), "", "", precision0(item.carrier_usage),  "","",""]
    end
    
  end
  
   
   
  
  def cost(num)
    @view.number_to_currency(num)
  end
  
  def precision(num)
   @view.number_with_delimiter(@view.number_with_precision(num, :precision => 2), :delimiter => ",") 
  end
  
  def precision0(num)
   @view.number_with_delimiter(@view.number_with_precision(num, :precision => 0), :delimiter => ",")  
  end
  
end

