class InvoicedetailreportPdf < Prawn::Document
  def initialize(user_id, view, customer_id, invoice_status, start_date, stop_date)
    @user_id = user_id
    super(top_margin: 30)
    @customer_id = customer_id
    @invoice_status = invoice_status
    @start_date = start_date
    @stop_date = stop_date
    @view = view 
    if !@customer_id.nil? and !@customer_id.blank?
      @customer = Party.find(@customer_id)
      @customerfull = @customer.partyname
    else
      @customerfull = ""
    end

     invoice_header
     rowcount = 0
     table [["Customer", "Invoice No.",  "Invoice Date", "Status", "Ship amount", "Ship charge", "Invoice amount", "Terms", "Payment reference"]],  

     :row_colors => [ "FFFFFF"], :cell_style => {:border_width => 1, :size => 8, :text_color => "346842" } do
     
         row(0).font_style = :bold
         #row(rowcount).font_size = 10
          columns(0).width = 100
          columns(1).width = 70
          columns(2).width = 70
          columns(3..8).width = 50
          columns(0..3).align = :left
          columns(4..6).align = :right
          columns(7..8).align = :left
     
         self.header = true
         rowcount += 1
       end
     
       if @customer_id.nil? || @customer_id.blank?
         @customers = Invoice.get_customer_for_invoice(@user_id, @customer_id,  @start_date, @stop_date)
  
         @customers.each do |t|
 
             move_down 5
             #text "#{t.partyname}", size: 8, style: :bold, :align => :left
      
              customer_invoice_items( t.id, t.partyname)
              customer_invoice_item_summary(t.id, t.partyname)
       
          end
     
       else

            move_down 10
          #text "#{t.partyname}", size: 8, style: :bold, :align => :left
      
            customer_invoice_items( @customer.id, @customer.partyname)
            customer_invoice_item_summary(@customer.id, @customer.partyname)
       end
  
       total_invoice_item_summary()

  end

  
  def invoice_header
    text "Invoice Detail Report", size: 14, style: :bold, :align => :center
    move_down 5

    text "for Customer - #{@partyname} / Status - #{@invoice_status}", size: 8, style: :bold, :align => :center
    move_down 5
    text "for Date Range - (#{@start_date} - #{@stop_date})", size: 8, style: :bold, :align => :center
    move_down 5
  end
  
  def customer_invoice_items(id, partyname)
    move_down 5
    rowcount = 0
    table invoice_item_rows(id, partyname), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 7, :text_color => "346842" } do  
      columns(0).width = 100
      columns(1).width = 70
      columns(2).width = 70
      columns(3..8).width = 50
      columns(0..3).align = :left
      columns(4..6).align = :right
      columns(7..8).align = :left
     
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def invoice_item_rows(id, partyname)

    Invoice.invoice_detail_items(@user_id, id, @invoice_status,  @start_date, @stop_date).map do |item|
      [item.partyname, item.invoice_number, item.invoice_date, item.invoice_status, cost(item.ship_amount), cost(item.ship_charge), cost(item.total_amount), item.invoice_terms, item.payment_reference]
    end
  end
  
  def customer_invoice_item_summary(id, partyname)
    move_down 5

    rowcount = 0
    table invoice_item_summary(id, partyname), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
      column(0..1)..font_style = :bold
      #row(rowcount).font_size = 10
      columns(0).width = 100
      columns(1).width = 70
      columns(2).width = 70
      columns(3..8).width = 50
      columns(0..3).align = :left
      columns(4..6).align = :right
      columns(7..8).align = :left
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def invoice_item_summary(id, partyname)
 
    Invoice.invoice_detail_item_summary(@user_id, id,  @invoice_status,  @start_date, @stop_date).map do |item|
      ["Customer total", " ", " ", " ", cost(item.ship_amount), cost(item.ship_charge), cost(item.total_amount), " ", " "]
     
    end
  end
  
  
  
  def total_invoice_item_summary()
    move_down 5

    rowcount = 0
    table total_invoice_item_summary_rows(), :row_colors => ["FFFFFF", "FFFFFF"], :cell_style => {:border_width => 0, :size => 7, :text_color => "346842" } do  
      row(0).font_style = :bold
      column(0..1)..font_style = :bold
      #row(rowcount).font_size = 10
      columns(0).width = 100
      columns(1).width = 70
      columns(2).width = 70
      columns(3..8).width = 50
      columns(0..3).align = :left
      columns(4..6).align = :right
      columns(7..8).align = :left
      
      self.header = true
      rowcount += 1
    end
    
  end
  def total_invoice_item_summary_rows()
 
    Invoice.invoice_total_item_summary(@user_id, "", @invoice_status,   @start_date, @stop_date).map do |item|
      ["Grand total", " ", " ", " ", cost(item.ship_amount), cost(item.ship_charge), cost(item.total_amount), " ", " "]
      
    end
  end
  
  def cost(num)
    @view.number_to_currency(num)
  end
  
  def precision(num)
    @view.number_with_precision(num, :precision => 2)
  end
  
end

