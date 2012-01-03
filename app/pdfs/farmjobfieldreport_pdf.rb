class FarmjobfieldreportPdf < Prawn::Document
  def initialize(user_id, view, fieldtask_id, field_id, cropplan_id,  start_date, job_status, stop_date, sort_sequence)
    @user_id = user_id
    super(top_margin: 30)
    @fieldtask_id = fieldtask_id
    @field_id = field_id
    @cropplan_id = cropplan_id
    @job_status = job_status
    @start_date = start_date
    @stop_date = stop_date
    @sort_sequence = sort_sequence
    @view = view 
    farmjob_header
    farmjob_items
    farmjob_summary
  end
  
  def farmjob_header
    text "Farmjob Report", size: 20, style: :bold, :align => :center
    move_down 5
    text "for Date Range - (#{@start_date} - #{@stop_date})", size: 8, style: :bold, :align => :center
  end
  
  def farmjob_items
    move_down 20
    rowcount = 0
    table farmjob_item_rows, :row_colors => ["F4F4F4", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
      row(0).size = 8
      row(0).background_color = 'C1C1C1'
      columns(4).width = 50
      columns(5).width = 40
      columns(6).width = 35
      columns(10).width = 55
      columns(6..10).align = :right
     
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def farmjob_item_rows

    [["Task Description", "Field", "Crop plan", "Area size", "Job date", "Status", "Total hours", "Job cost", "Supply cost", "Labor cost", "Equipment cost"]] +
    Farmjob.farmjob_field_items(@user_id, @fieldtask_id, @field_id, @cropplan_id,  @start_date, @job_status, @stop_date, @sort_sequence).map do |item|
      [item.taskdescription, item.fieldname, item.cropplanfull, item.area_size, item.start_date, item.job_status, item.total_hours, cost(item.total_cost), cost(item.supply_cost), cost(item.labor_cost), cost(item.equipment_cost)]
    end
  end
  
  def farmjob_summary
    move_down 20
    text "Summary", size: 10, style: :bold
    move_down 10
    rowcount = 0
    table farmjob_item_summary, :row_colors => ["DDDDDD", "FFFFFF"], :cell_style => { :size => 8, :text_color => "346842" } do  
      row(0).font_style = :bold
      #row(rowcount).font_size = 10
      columns(1..4).align = :right
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def farmjob_item_summary

    [[ "Total hours", "Job cost", "Supply cost", "Labor cost", "Equipment cost"]] +
    Farmjob.farmjob_field_summary(@user_id, @fieldtask_id, @field_id, @cropplan_id,  @start_date, @job_status, @stop_date, @sort_sequence).map do |item|
      [item.total_hours, cost(item.total_cost), cost(item.supply_cost), cost(item.labor_cost), cost(item.equipment_cost)]
    end
  end
  
  def cost(num)
    @view.number_to_currency(num)
  end
end

