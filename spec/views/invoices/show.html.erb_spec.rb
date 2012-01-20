require 'spec_helper'

describe "invoices/show.html.erb" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :invoice_number => "Invoice Number",
      :shipment_id => 1,
      :ship_amount => 1.5,
      :ship_charge => 1.5,
      :total_amount => 1.5,
      :invoice_terms => "Invoice Terms",
      :invoice_status => "Invoice Status",
      :payment_reference => "Payment Reference"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Invoice Number/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Invoice Terms/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Invoice Status/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Payment Reference/)
  end
end
