class InvoicereportPdf < Prawn::Document
  def initialize(user_id, view, customer_id, start_date, stop_date, invoice_number, reprint, sort_sequence)
    @user_id = user_id
    super(top_margin: 30)
    @customer_id = customer_id
    @start_date = start_date
    @stop_date = stop_date
    @invoice_number = invoice_number
    @reprint = reprint
    @sort_sequence = sort_sequence
    @view = view 
    invoice_header
    #invoice_items
  end
  
  def invoice_header
    
    
    @invoices = Invoice.get_ready_invoices(@user_id, @customer_id, @start_date,  @stop_date, @invoice_number, @reprint, @sort_sequence)

    @invoices.each do |inv|
      
      #Heading
      fill_color "FF9900"
      text "by iFarmService", size: 8, style: :normal, :align => :right
      fill_color "404040"
      
      #image "/users/edwardpabst/rails_projects/myfarm/public/images/serresbanner.png", :at => [0, 700], :width => 160, :height => 32

      text "Invoice", size: 12, style: :bold, :align => :center
      
      #Date and invoice number
      draw_text  "Date ", size: 8, style: :normal,
                              :at => [420, 690] 
      draw_text  "#{inv.invoice_date.to_formatted_s(:long)}", size: 8, style: :normal,
                              :at => [500, 690]                 
  
      draw_text  "Invoice No.", size: 8, style: :normal,
                  :at => [420, 680] 
      draw_text  "#{inv.invoice_number}", size: 8, style: :normal,
                  :at => [500, 680]
      
      fill_color "A7C6D6"
      font("Helvetica") do
        text "#{inv.billname}", size: 20, style: :italic, :align => :left
      end
      fill_color "404040"

      #Billing source info
      draw_text  "#{inv.billname}", size: 8, style: :normal,
                              :at => [10, 650] 
      draw_text  "#{inv.billaddress}", size: 8, style: :normal,
                              :at => [10, 635]                 
      draw_text  "#{inv.billcity} #{inv.billstate}, #{inv.billpostalcode}", size: 8, style: :normal,
                  :at => [10, 620]
      draw_text  "Phone: #{inv.billphone}", size: 8, style: :normal,
                  :at => [10, 605] 
      draw_text  "#{inv.billemail}", size: 8, style: :normal,
                  :at => [10, 590]

      #Billing to info
      fill_color "A7C6D6"
      draw_text  "Bill to", size: 8, style: :normal,
                              :at => [210, 660]
      fill_color "404040"
      draw_text  "#{inv.partyname}", size: 8, style: :normal,
                              :at => [210, 650] 
      draw_text  "#{inv.partyaddress1}", size: 8, style: :normal,
                              :at => [210, 635]                 
      draw_text  "#{inv.partycity} #{inv.partystate}, #{inv.partypostalcode}", size: 8, style: :normal,
                  :at => [210, 620]
      draw_text  "#{inv.partyphone}", size: 8, style: :normal,
                  :at => [210, 605] 
      draw_text  "#{inv.partyemail}", size: 8, style: :normal,
                  :at => [210, 590] 
                  

      #Ship to info
      fill_color "A7C6D6"
      draw_text  "Ship to", size: 8, style: :normal,
                              :at => [410, 660]
      fill_color "404040"
      draw_text  "#{inv.partyname}", size: 8, style: :normal,
                              :at => [410, 650] 
      draw_text  "#{inv.ship_address1}", size: 8, style: :normal,
                              :at => [410, 635]                 
      draw_text  "#{inv.ship_city} #{inv.ship_state}, #{inv.ship_postalcode}", size: 8, style: :normal,
                  :at => [410, 620]
      draw_text  "#{inv.ship_phone}", size: 8, style: :normal,
                  :at => [410, 605]
       
      # Invoice totals     
                      
        move_cursor_to 560
        table invoice_totals(inv), :row_colors => ["A7C6D6", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 7, :text_color => "404040" } do  
          row(0).font_style = :normal
          row(0).size = 8
          row(0).background_color = 'A7C6D6'
          columns(0..5).width = 87
          columns(1..5).align = :right
          self.header = false
        end
        
      # Invoice details
      move_down 20
         invoice_items(inv.shipment_id)
              
                  
                                 
      start_new_page
    end
    
  end
  
  def invoice_totals(inv)
    @types = Type.get_terms_by_name("#{inv.invoice_terms}", @user_id)
    @term_days = 0
    @types.each do |t|
      @term_days = t.type_value_integer
    end
 
      @duedate = inv.invoice_date.to_date + @term_days.days

    
    [["Sales person", "Shipped Amount",  "Shipping Charge" ,  "Total Amount Due" , "Terms", "Due Date"]] +
    Invoice.get_invoice_total_record(inv.id).map do |item|
      [item.brokername, cost(item.ship_amount), cost(item.ship_charge), cost(item.total_amount),  item.invoice_terms, @duedate.to_formatted_s(:long)]
    end
  end
  
  def invoice_items(shipment_id)
    move_down 5
    rowcount = 0
    table invoice_item_rows(shipment_id), :row_colors => ["F4F4F4", "FFFFFF"], :cell_style => {:border_width => 0,  :size => 7, :text_color => "404040" } do  
      row(0).font_style = :normal
      row(0).size = 8
      row(0).background_color = 'A7C6D6'
      columns(0..1).width = 100
      columns(2..6).width = 65
      columns(4).align = :right
      columns(6).align = :right
     
      
      self.header = true
      rowcount += 1
    end
    
  end
  
  def invoice_item_rows(shipment_id)
    
    [["Item", "Ship location",  "Grade" ,  "Ship qty" , "Price" ,  "UOM" , "Ext Amount"]] +
    Shipmentdetail.get_shipment_details(@user_id, shipment_id).map do |item|
      [item.cropplanfull, item.storagename, item.grade, item.qty, cost(item.price), item.qty_uom, cost(item.ext_amount)]
    end
    
  end
  

  
  def cost(num)
    @view.number_to_currency(num)
  end
  
end

