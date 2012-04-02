class FarmjobbillingreportPdf < Prawn::Document
  def initialize(user_id, view, client_id, farm_id, fieldtask_id, field_id, cropplan_id,  start_date, job_status, stop_date, sort_sequence)
    @user_id = user_id
    super(top_margin: 30)
    @client_id = client_id
    @farm_id = farm_id
    @fieldtask_id = fieldtask_id
    @field_id = field_id
    @cropplan_id = cropplan_id
    @job_status = job_status
    @start_date = start_date
    @stop_date = stop_date
    @sort_sequence = sort_sequence
    @view = view 
    farmjob_header

    
    if @client_id.nil? || @client_id.blank?

      @clientlist = Field.get_clientlist(@user_id)


      @clientlist.each do |t|
        @client_id = t.client_id
        build_report
      end
    

  
    else

      build_report
      
     end
  end
  
  def build_report
    @party = Party.find(@client_id)
    @client_name = @party.partyname
    text "Client - (#{@client_name})", size: 8, style: :bold, :align => :left
    move_down 2
    farmjob_items
    farmjob_summary
  end
  
  def farmjob_header
    text "Farmjob Billing Report", size: 14, style: :bold, :align => :center
    move_down 5
    text "for Date Range - (#{@start_date} - #{@stop_date})", size: 8, style: :bold, :align => :center
  end
  
  def farmjob_items
    move_down 5
    rowcount = 0
    table farmjob_item_rows, :row_colors => ["F4F4F4", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 7, :text_color => "346842" } do  
      row(0).font_style = :normal
      row(0).size = 8
      row(0).background_color = 'C1C1C1'

      columns(7..11).align = :right
     
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def farmjob_item_rows

    [["Task Description", "Farm", "Field", "Crop plan", "Area size", "Job date", "Status", "Total hours", "Job billing", "Supply billing", "Labor billing", "Equip. billing"]] +
    Farmjob.farmjob_billing_items(@user_id, @client_id, @farm_id, @fieldtask_id, @field_id, @cropplan_id,  @start_date, @job_status, @stop_date, @sort_sequence).map do |item|
      [item.taskdescription, item.farmname, item.fieldname, item.cropplanfull, item.area_size, item.start_date, item.job_status, item.total_hours, cost(item.total_billing), cost(item.supply_billing), cost(item.labor_billing), cost(item.equipment_billing)]
    end
  end
  
  def farmjob_summary
    move_down 20
    text "Client Summary", size: 7, style: :bold
    move_down 10
    rowcount = 0
    table farmjob_item_summary, :row_colors => ["DDDDDD", "FFFFFF"], :cell_style => { :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
      #row(rowcount).font_size = 10
      columns(1..4).align = :right
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def farmjob_item_summary

    [[ "Total hours", "Job billing", "Supply billing", "Labor billing", "Equipment billing"]] +
    Farmjob.farmjob_billing_summary(@user_id,  @client_id, @farm_id, @fieldtask_id, @field_id, @cropplan_id,  @start_date, @job_status, @stop_date, @sort_sequence).map do |item|
      [item.total_hours, cost(item.total_billing), cost(item.supply_billing), cost(item.labor_billing), cost(item.equipment_billing)]
    end
  end
  
  def cost(num)
    @view.number_to_currency(num, :precision => 0, :delimiter => ",")
  end
end

