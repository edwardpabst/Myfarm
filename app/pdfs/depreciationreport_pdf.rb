class DepreciationreportPdf < Prawn::Document
  def initialize(user_id, view, category)
    @user_id = user_id
    super(top_margin: 30)
    @category = category
    @view = view 

 
     depreciation_header
     rowcount = 0
     table [[ "Equipment", "Purchase price", "Purch year", "Int. Rate", "Life years", "Salvage value", "Depreciation /year", "Cost recovery /year", "Cost ownership /year", "Cost /hour" ]],  

     :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 1, :size => 7, :text_color => "346842" } do
     
         row(0).font_style = :bold
         #row(rowcount).font_size = 10
         columns(0).width = 95
         columns(1).width = 60
         columns(2).width = 35
         columns(3).width = 35
         columns(4).width = 35
         columns(5).width = 50
         columns(6).width = 55
         columns(7).width = 60
         columns(8).width = 65
         columns(9).width = 50

          
          columns(0..2).align = :left
          columns(3..9).align = :right
     
         self.header = true
         rowcount += 1
       end
     
   
            depreciation_items(@category)
            depreciation_item_summary(@category)
      
  

  end

  
  def depreciation_header
    fill_color "FF9900"
    text "iFarmService", size: 18, style: :normal, :align => :left, :color =>  [ "RED"]
    fill_color "404040"
    
    text "Depreciation and Cost of ownership Report", size: 10, style: :bold, :align => :center
    move_down 5

    text "for Category - #{@category}", size: 8, style: :bold, :align => :center
    move_down 5

  end
  
  def depreciation_items(category)
    move_down 5
    @depreciation = Equipment.depreciation_items(@user_id, category)
    if !@depreciation.nil?
      rowcount = 0
      table depreciation_item_rows(category), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 8, :text_color => "346842" } do  

 
        columns(0).width = 95
        columns(1).width = 60
        columns(2).width = 35
        columns(3).width = 35
        columns(4).width = 35
        columns(5).width = 50
        columns(6).width = 55
        columns(7).width = 60
        columns(8).width = 65
        columns(9).width = 50

       
         columns(0..2).align = :left
         columns(3..9).align = :right
      
        self.header = true
        rowcount += 1
      end
    end
    
  end
  
  def depreciation_item_rows(category)

    @depreciation.map do |item|
      [ item.equipmentname, cost(item.purchase_price), item.purchase_year, item.interest_rate, item.life_years, cost(item.salvage_value), cost(item.depreciation_year), cost(item.capital_recovery_year), cost(item.cost_unit), cost(item.cost_unit_hour)]
    end
  end
  
  def depreciation_item_summary(category)
    move_down 5
    @depreciation = Equipment.depreciation_item_summary(@user_id, category)
    if @depreciation.nil?
      rowcount = 0
      table depreciation_item_summary_rows(category), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0, :size => 8, :text_color => "346842" } do  
        row(0).font_style = :bold
        column(0..1)..font_style = :bold
        #row(rowcount).font_size = 10
 
        columns(0).width = 95
        columns(1).width = 60
        columns(2).width = 35
        columns(3).width = 35
        columns(4).width = 35
        columns(5).width = 50
        columns(6).width = 55
        columns(7).width = 60
        columns(8).width = 65
        columns(9).width = 50
       
         columns(0..2).align = :left
         columns(3..9).align = :right
      
        self.header = true
        rowcount += 1
      end
    end
    
  end
  
  def depreciation_item_summary_rows(category)
 
    @depreciation.map do |item|
      ["Total",  "", "", "", "", "", cost(item.depreciation_year), cost(item.capital_recovery_year), cost(item.cost_unit), ""]
 end
  end
  
  def cost(num)
    @view.number_to_currency(num, :precision => 0)
  end
  
  def precision(num)
    @view.number_with_precision(num, :precision => 2)
  end
  
end

