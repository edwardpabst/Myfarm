require 'spec_helper'

describe "invoices/new.html.erb" do
  before(:each) do
    assign(:invoice, stub_model(Invoice,
      :invoice_number => "MyString",
      :shipment_id => 1,
      :ship_amount => 1.5,
      :ship_charge => 1.5,
      :total_amount => 1.5,
      :invoice_terms => "MyString",
      :invoice_status => "MyString",
      :payment_reference => "MyString"
    ).as_new_record)
  end

  it "renders new invoice form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => invoices_path, :method => "post" do
      assert_select "input#invoice_invoice_number", :name => "invoice[invoice_number]"
      assert_select "input#invoice_shipment_id", :name => "invoice[shipment_id]"
      assert_select "input#invoice_ship_amount", :name => "invoice[ship_amount]"
      assert_select "input#invoice_ship_charge", :name => "invoice[ship_charge]"
      assert_select "input#invoice_total_amount", :name => "invoice[total_amount]"
      assert_select "input#invoice_invoice_terms", :name => "invoice[invoice_terms]"
      assert_select "input#invoice_invoice_status", :name => "invoice[invoice_status]"
      assert_select "input#invoice_payment_reference", :name => "invoice[payment_reference]"
    end
  end
end
