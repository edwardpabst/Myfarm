class Po < ActiveRecord::Base
    #acts_as_reportable
    
    attr_accessor  :ext_amt
    attr_accessible :user_id, :ponumber, :orderdate, :duedate, :po_status, :payment_type, :payment_number, :supplier_id, 
                    :notes, :po_type, :order_amount


    has_many :podetails, :dependent => :destroy


    validates_presence_of  :ponumber, :orderdate, :duedate, :po_status, :supplier_id,  :po_type  

  end

