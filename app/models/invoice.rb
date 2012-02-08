class Invoice < ActiveRecord::Base
  
   attr_accessible :shipment_id, :invoice_number, :invoice_date, :invoice_status, :invoice_terms, :ship_amount,
                   :ship_charge, :total_amount, :payment_reference
                   
            
                   def self.get_ready_shipments(user_id, customer_id, start_date,  stop_date)
                     sql_statement = "Select *
                     from shipments 
                     where shipments.user_id = #{user_id} 
                     and ship_status = 'shipped' "

                     sql = build_where_clause(sql_statement, customer_id,  start_date,  stop_date)

                     return Invoice.find_by_sql("#{sql}")           
                   end  
                    

                   def self.build_where_clause(sql_statement, customer_id, start_date, stop_date )

                      if !customer_id.nil? and !customer_id.blank?
                        customer_id_select =  " and customer_id = #{customer_id} "
                        sql_statement += customer_id_select
                      end

                     if !start_date.nil? and !start_date.blank?
                       date_select =  " and ship_date >= '#{start_date}'"
                       date_select +=  " and ship_date <= '#{stop_date}'"
                       sql_statement += date_select
                     end
                     
                     return sql_statement
                  end
                     
                     def self.get_ready_invoices(user_id, customer_id, start_date,  stop_date, invoice_number, reprint, sort_sequence)
                       sql_statement = "Select inv.id, inv.shipment_id, p1.partyname, p1.partyaddress1, p1.partycity, p1.partystate, 
                                                p1.partypostalcode, p1.partyphone, p1.partyemail,sh.shipto_street as ship_address1, 
                                               sh.shipto_city as ship_city, sh.shipto_state as ship_state, sh.shipto_postalcode as ship_postalcode, 
                                               p1.ship_phone, p2.partyname as billname, p2.partyaddress1 as billaddress, 
                                               p2.partycity as billcity, p2.partystate as billstate, 
                                               p2.partypostalcode as billpostalcode, p2.partyphone as billphone, 
                                               p2.partyemail as billemail, p3. partyname as brokername,
                                               invoice_number, invoice_date, invoice_terms, inv.ship_amount, ship_charge,
                                               total_amount
                       from invoices inv
                       join shipments sh on inv.shipment_id = sh.id 
                       join parties p1 on sh.customer_id = p1.id
                       join farms on sh.farm_id = farms.id
                       join parties p2 on farms.party_id = p2.id
                       left join parties p3 on sh.broker_id = p3.id
                       where inv.user_id = #{user_id} "

                       sql = build_where_clause_invoices(sql_statement, customer_id,  start_date,  stop_date, invoice_number, reprint, sort_sequence)

                       return Invoice.find_by_sql("#{sql}")           
                     end  


                     def self.build_where_clause_invoices(sql_statement, customer_id, start_date, stop_date, invoice_number, reprint, sort_sequence )
    
                      if reprint == 'yes'
                         reprint_select = " and invoice_status in ('PRINTED', 'RE-PRINTED', 'PAID/CLOSED') "
                         sql_statement += reprint_select
                      else 
                        reprint_select = " and invoice_status = 'NEW' "
                        sql_statement += reprint_select
                      end
                      
                      if !invoice_number.nil? and !invoice_number.blank?
                        number_select = " and invoice_number = '#{invoice_number}' "
                        sql_statement += number_select
                      else
                       
  
                        if !customer_id.nil? and !customer_id.blank?
                          customer_id_select =  " and customer_id = #{customer_id} "
                          sql_statement += customer_id_select
                        end

                         if !start_date.nil? and !start_date.blank?
                           date_select =  " and invoice_date >= '#{start_date}' "
                           date_select +=  " and invoice_date <= '#{stop_date}' "
                           sql_statement += date_select
                         end

                      end

                     return sql_statement

                   end 
                   
                   
                   def self.get_invoice_total_record(inv_id)
                      return Invoice.find_by_sql("Select partyname as brokername, inv.ship_amount,
                                        inv.ship_charge, inv.total_amount, inv.invoice_terms
                                    from invoices inv
                                    join shipments sh on inv.shipment_id = sh.id
                                    left join parties p1 on sh.broker_id = p1.id
                                    where inv.id = #{inv_id}") 
                    end
                    
                    
                    def self.get_specific_invoice(inv_id)
                       return Invoice.find_by_sql("Select partyname as customername, inv.*
                                     from invoices inv
                                     join shipments sh on inv.shipment_id = sh.id
                                     left join parties p1 on sh.customer_id = p1.id
                                     where inv.id = #{inv_id}") 
                     end  
end
