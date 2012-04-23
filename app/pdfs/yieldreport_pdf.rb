class YieldreportPdf < Prawn::Document
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
     yield_header
     rowcount = 0
     table [["Crop plan", "Field",  "Area size", "Avg yield/acre", "Harvest yield/acre", "% change", "Revenue acre", "Total Revenue"]],  

     :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 1, :size => 8, :text_color => "346842" } do
     
         row(0).font_style = :bold
         #row(rowcount).font_size = 10
          columns(0).width = 120
          columns(1).width = 80
          columns(2).width = 40
          columns(3..7).width = 60
          columns(0..2).align = :left
          columns(3..7).align = :right
     
         self.header = true
         rowcount += 1
       end
     
       if @cropplan_id.nil? || @cropplan_id.blank?
         @cropplans = Cropplan.get_cropplan_for_yield(@user_id, @cropplan_id,  @start_date, @stop_date)
  
         @cropplans.each do |t|
           if !@field_id.nil? and !@field_id.blank?
             @st = Scaleticket.get_by_cropplan_field(t.id, @field_id)
             if !@st.nil? and !@st.empty?
               move_down 5
               text "#{t.cropplanfull}", size: 8, style: :bold, :align => :left

                cropplan_yield_items( t.id, t.cropplanfull)
                cropplan_yield_item_summary(t.id, t.cropplanfull)              
             end
           else
             move_down 5
             text "#{t.cropplanfull}", size: 8, style: :bold, :align => :left
      
              cropplan_yield_items( t.id, t.cropplanfull)
              cropplan_yield_item_summary(t.id, t.cropplanfull)
           end
         end
     
       else

            move_down 10
           text "#{@cropplan.cropplanfull}", size: 8, style: :bold, :align => :left
      
            cropplan_yield_items( @cropplan.id, @cropplan.cropplanfull)
            cropplan_yield_item_summary(@cropplan.id, @cropplan.cropplanfull)
       end
  

  end

  
  def yield_header
    fill_color "FF9900"
    text "iFarmService", size: 18, style: :normal, :align => :left, :color =>  [ "RED"]
    fill_color "404040"
    
    text "Harvest Yield Report", size: 14, style: :bold, :align => :center
    move_down 5

    text "for Cropplan - #{@cropplanfull} / Field - #{@fieldname}", size: 8, style: :bold, :align => :center
    move_down 5
    text "for Date Range - (#{@start_date} - #{@stop_date})", size: 8, style: :bold, :align => :center
    move_down 5
  end
  
  def cropplan_yield_items(id, cropplanfull)
    move_down 5
    rowcount = 0
    table yield_item_rows(id, cropplanfull), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 8, :text_color => "346842" } do  

       columns(0).width = 120
       columns(1).width = 80
       columns(2).width = 40
       columns(3..7).width = 60
       columns(0..2).align = :left
       columns(3..7).align = :right
     
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def yield_item_rows(id, cropplanfull)

    Cropplan.cropplan_yield_items(@user_id, id, @field_id,  @start_date, @stop_date).map do |item|
      ["", item.fieldname, item.number_acres, item.avg_yield_acre, precision(item.harvest_yield_acre), precision(item.percent_diff), cost(item.revenue_acre), cost(item.total_revenue)]
    end
  end
  
  def cropplan_yield_item_summary(id, cropplanfull)
    move_down 5

    rowcount = 0
    table yield_item_summary(id, cropplanfull), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
      row(0).font_style = :bold
      column(0..1)..font_style = :bold
      #row(rowcount).font_size = 10
      columns(0).width = 120
      columns(1).width = 80
      columns(2).width = 40
      columns(3..7).width = 60
      columns(0..2).align = :left
      columns(3..7).align = :right
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def yield_item_summary(id, cropplanfull)
 
    Cropplan.cropplan_yield_item_summary(@user_id, id,   @start_date, @stop_date).map do |item|
      ["Total", "",  "", item.avg_yield_acre, precision(item.harvest_yield_acre), precision(item.percent_diff), cost(item.revenue_acre), cost(item.total_revenue)]
    end
  end
  
  def cost(num)
    @view.number_to_currency(num)
  end
  
  def precision(num)
    @view.number_with_precision(num, :precision => 2)
  end
  
end

