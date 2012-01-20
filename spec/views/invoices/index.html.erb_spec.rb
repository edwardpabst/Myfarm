require 'spec_helper'

describe "invoices/index.html.erb" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice,
        :invoice_number => "Invoice Number",
        :shipment_id => 1,
        :ship_amount => 1.5,
        :ship_charge => 1.5,
        :total_amount => 1.5,
        :invoice_terms => "Invoice Terms",
        :invoice_status => "Invoice Status",
        :payment_reference => "Payment Reference"
      ),
      stub_model(Invoice,
        :invoice_number => "Invoice Number",
        :shipment_id => 1,
        :ship_amount => 1.5,
        :ship_charge => 1.5,
        :total_amount => 1.5,
        :invoice_terms => "Invoice Terms",
        :invoice_status => "Invoice Status",
        :payment_reference => "Payment Reference"
      )
    ])
  end

  it "renders a list of invoices" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Invoice Number".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Invoice Terms".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Invoice Status".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Reference".to_s, :count => 2
  end
end
