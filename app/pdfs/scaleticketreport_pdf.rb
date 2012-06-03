class ScaleticketreportPdf < Prawn::Document
  def initialize(user_id, view, cropplan_id, field_id, start_date, stop_date)
    @user_id = user_id
    super(top_margin: 30)
    @cropplan_id = cropplan_id
    @field_id = field_id
    @start_date = start_date
    @stop_date = stop_date
    @view = view 
    if !@cropplan_id.nil? and !@cropplan_id.blank?
      @cropplan = Cropplan.find(cropplan_id)
      @cropplanfull = @cropplan.cropplanfull
    else
      @cropplanfull = ""
    end
     if !@field_id.nil? and !@field_id.blank?
       @field = Field.find(@field_id)
       @fieldname = @field.fieldname
     else
      @fieldname = ""
     end
     scaleticket_header

       
       if @cropplan_id.nil? || @cropplan_id.blank?
 
         @cropplanlist = Cropplan.get_cropplan_for_scaleticket(@user_id, "",  @start_date, @stop_date)
  
         @last_cropplan = 0
         @last_field = 0
         @first_time = 0
         
         @cropplanlist.each do |t|
           if !@field_id.nil? and !@field_id.blank?
             @st = Scaleticket.get_by_cropplan_field(t.id, @field_id)
             if !@st.nil? and !@st.empty?               
               cropplan_level_breaks(t)       
             end
           else                 
             cropplan_level_breaks(t)
           end
         end
         cropplan_scaleticket_field_summary(@last_cropplan, @last_cropplanfull, @last_field)
         cropplan_scaleticket_cropplan_summary(@last_cropplan, @last_cropplanfull)
     
       else

         @cropplanlist = Cropplan.get_cropplan_for_scaleticket(@user_id, @cropplan_id,  @start_date, @stop_date)
  
         @last_cropplan = 0
         @last_cropplanfull = ""
         @last_field = 0
         @first_time = 0
         
         @cropplanlist.each do |t|
          cropplan_level_breaks(t)
         end
         cropplan_scaleticket_field_summary(@last_cropplan, @last_cropplanfull, @last_field)
         cropplan_scaleticket_cropplan_summary(@last_cropplan, @last_cropplanfull)
        end
  

  end
  
  def cropplan_level_breaks(t)
         
      if @first_time == 1 and t.id != @last_cropplan
        cropplan_scaleticket_field_summary(@last_cropplan, @last_cropplanfull, @last_field)
        cropplan_scaleticket_cropplan_summary(@last_cropplan, @last_cropplanfull)
        move_down 5
        move_down 6
        text "  Crop - #{t.cropplanfull}", size: 8, style: :bold, :align => :left 
        move_down 2
        text " Farm - #{t.farmname}  Field - #{t.fieldname}", size: 8, style: :bold, :align => :left   
      elsif @first_time == 1 and t.field_id != @last_field
        cropplan_scaleticket_field_summary(@last_cropplan, @last_cropplanfull, @last_field)
          move_down 5
          move_down 2
          text " Farm - #{t.farmname}  Field - #{t.fieldname}", size: 8, style: :bold, :align => :left  
         
      elsif @first_time == 0
        move_down 6
        text "  Crop - #{t.cropplanfull}", size: 8, style: :bold, :align => :left 
        move_down 2
       text " Farm - #{t.farmname}  Field - #{t.fieldname}", size: 8, style: :bold, :align => :left  
      end

 
       cropplan_scaleticket_items( t.id, t.cropplanfull, t.field_id)
       
       if @first_time == 0
         @first_time = 1
       end
       
       @last_cropplan = t.id
       @last_cropplanfull = t.cropplanfull
       @last_field = t.field_id
    
     
  end

  
  def scaleticket_header
    #repeat :all do
       fill_color "FF9900"
       text "iFarmService", size: 18, style: :normal, :align => :left, :color =>  [ "RED"]
       fill_color "404040"
    
        text "Scale Ticket Report", size: 14, style: :bold, :align => :center 
        move_down 5

        text "for Cropplan - #{@cropplanfull} / Field - #{@fieldname}", size: 8, style: :bold, :align => :center
        move_down 5
        text "for Date Range - (#{@start_date} - #{@stop_date})", size: 8, style: :bold, :align => :center
        move_down 5
        rowcount = 0
        table [["",  "Area size", "Ticket ID", "Date", "Gross weight", "Tare weight", "Net weight", "Inventory UOM", "Moisture%", "Qty(wet)", "Qty/(Dry)"]],  

        :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 1, :size => 8, :text_color => "346842" } do

            row(0).font_style = :bold
            #row(rowcount).font_size = 10

            columns(0).width = 50
            columns(1).width = 50
            columns(2..3).width = 50
            columns(4).width = 50
            columns(5..8).width = 50
            columns(9..10).width = 45
            columns(0..3).align = :left
            columns(4..10).align = :right

            self.header = true
            rowcount += 1
          end
    #end
  end
  
  def cropplan_scaleticket_items(id, cropplanfull, field_id)
    move_down 5
    @scaleticket_data = Cropplan.cropplan_scaleticket_items(@user_id, id, field_id,  @start_date, @stop_date)
    if !@scaleticket_data.nil?   
      rowcount = 0
      table scaleticket_item_rows(id, cropplanfull, field_id), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 8, :text_color => "346842" } do  
      
        columns(0).width = 50
        columns(1).width = 50
        columns(2..3).width = 50
        columns(4).width = 50
        columns(5..8).width = 50
        columns(9..10).width = 45
        columns(0..3).align = :left
        columns(4..10).align = :right
      
        self.header = true
        rowcount += 1
      end
    end
   
  end
  
  def scaleticket_item_rows(id, cropplanfull, field_id)

   @scaleticket_data.map do |item|
      ["", item.number_acres, item.ticket_id, item.tran_date.to_date, precision0(item.gross_weight), precision0(item.tare_weight), precision0(item.net_weight),  item.inventory_uom, precision(item.moisture_pct), precision0(item.qty_wet), precision0(item.qty_dry)]
    end
  end
  
  def cropplan_scaleticket_field_summary(id, cropplanfull, field_id)

    @scaleticket_data = Cropplan.cropplan_scaleticket_field_summary(@user_id, id,   @start_date, @stop_date, field_id)
    if !@scaleticket_data.nil? 
      rowcount = 0
      table scaleticket_field_summary(id, cropplanfull, field_id), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
        row(0).font_style = :bold
        column(0..1)..font_style = :bold
        #row(rowcount).font_size = 10
        columns(0).width = 50
        columns(1).width = 50
        columns(2..3).width = 50
        columns(4).width = 50
        columns(5..8).width = 50
        columns(9..10).width = 45
        columns(0..3).align = :left
        columns(4..10).align = :right
      
        self.header = true
        rowcount += 1
      end
    end
    
  end
  
  def scaleticket_field_summary(id, cropplanfull, field_id)
      @scaleticket_data.map do |item|
      ["Field total",  "",  "", "", precision0(item.gross_weight), precision0(item.tare_weight), precision0(item.net_weight),  "", "", precision0(item.qty_wet), precision0(item.qty_dry)]
    end
    
  end
  
  def cropplan_scaleticket_cropplan_summary(id, cropplanfull)
    @scaleticket_data =  Cropplan.cropplan_scaleticket_cropplan_summary(@user_id, id,   @start_date, @stop_date)
    if !@scaleticket_data.nil?
      rowcount = 0
      table scaleticket_cropplan_summary(id, cropplanfull), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
        row(0).font_style = :bold
        column(1)..font_style = :bold
        #row(rowcount).font_size = 10
        columns(0).width = 50
        columns(1).width = 50
        columns(2..3).width = 50
        columns(4).width = 50
        columns(5..8).width = 50
        columns(9..10).width = 45
        columns(0..3).align = :left
        columns(4..10).align = :right
      
        self.header = true
        rowcount += 1
      end
    end
    
  end
  
  def scaleticket_cropplan_summary(id, cropplanfull)
 
   @scaleticket_data.map do |item|
   [ "Crop total",  "",  "", "", precision0(item.gross_weight), precision0(item.tare_weight), precision0(item.net_weight),  "", "", precision0(item.qty_wet), precision0(item.qty_dry)]
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

