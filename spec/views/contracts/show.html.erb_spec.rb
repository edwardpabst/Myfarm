require 'spec_helper'

describe "contracts/show.html.erb" do
  before(:each) do
    @contract = assign(:contract, stub_model(Contract,
      :party_id => 1,
      :cropplan_id => 1,
      :contract_uom => "Contract Uom",
      :contract_price => 1.5,
      :notes => "Notes",
      :min_qty => 1.5,
      :max_qty => 1.5,
      :payment_type => "Payment Type",
      :payment_terms => "Payment Terms"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Contract Uom/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Notes/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Payment Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Payment Terms/)
  end
end
