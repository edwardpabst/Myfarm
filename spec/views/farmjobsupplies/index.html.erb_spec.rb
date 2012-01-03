require 'spec_helper'

describe "farmjobsupplies/index.html.erb" do
  before(:each) do
    assign(:farmjobsupplies, [
      stub_model(Farmjobsupply,
        :user_id => 1,
        :farmjob_id => 1,
        :supply_id => 1,
        :actual_qty => 1.5
      ),
      stub_model(Farmjobsupply,
        :user_id => 1,
        :farmjob_id => 1,
        :supply_id => 1,
        :actual_qty => 1.5
      )
    ])
  end

  it "renders a list of farmjobsupplies" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
