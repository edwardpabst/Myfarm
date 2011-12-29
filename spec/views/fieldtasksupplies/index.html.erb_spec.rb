require 'spec_helper'

describe "fieldtasksupplies/index.html.erb" do
  before(:each) do
    assign(:fieldtasksupplies, [
      stub_model(Fieldtasksupply,
        :user_id => 1,
        :fieldtask_id => 1,
        :supply_id => 1
      ),
      stub_model(Fieldtasksupply,
        :user_id => 1,
        :fieldtask_id => 1,
        :supply_id => 1
      )
    ])
  end

  it "renders a list of fieldtasksupplies" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
