require 'spec_helper'

describe "pos/show.html.erb" do
  before(:each) do
    @po = assign(:po, stub_model(Po,
      :ponumber => "Ponumber",
      :user_id => 1,
      :po_status => "Po Status",
      :payment_type => "Payment Type",
      :payment_number => "Payment Number",
      :supplier_id => 1,
      :notes => "Notes",
      :po_type => "Po Type",
      :order_amount => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ponumber/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Po Status/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Payment Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Payment Number/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Notes/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Po Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
