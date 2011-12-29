require 'spec_helper'

describe "contracts/edit.html.erb" do
  before(:each) do
    @contract = assign(:contract, stub_model(Contract,
      :new_record? => false,
      :party_id => 1,
      :cropplan_id => 1,
      :contract_uom => "MyString",
      :contract_price => 1.5,
      :notes => "MyString",
      :min_qty => 1.5,
      :max_qty => 1.5,
      :payment_type => "MyString",
      :payment_terms => "MyString"
    ))
  end

  it "renders the edit contract form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => contract_path(@contract), :method => "post" do
      assert_select "input#contract_party_id", :name => "contract[party_id]"
      assert_select "input#contract_cropplan_id", :name => "contract[cropplan_id]"
      assert_select "input#contract_contract_uom", :name => "contract[contract_uom]"
      assert_select "input#contract_contract_price", :name => "contract[contract_price]"
      assert_select "input#contract_notes", :name => "contract[notes]"
      assert_select "input#contract_min_qty", :name => "contract[min_qty]"
      assert_select "input#contract_max_qty", :name => "contract[max_qty]"
      assert_select "input#contract_payment_type", :name => "contract[payment_type]"
      assert_select "input#contract_payment_terms", :name => "contract[payment_terms]"
    end
  end
end
