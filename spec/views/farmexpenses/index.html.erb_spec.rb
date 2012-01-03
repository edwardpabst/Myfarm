require 'spec_helper'

describe "farmexpenses/index.html.erb" do
  before(:each) do
    assign(:farmexpenses, [
      stub_model(Farmexpense,
        :farm_id => 1,
        :expense_type => "Expense Type",
        :expense_name => "Expense Name",
        :expense_amount => 1.5,
        :expense_year => "Expense Year"
      ),
      stub_model(Farmexpense,
        :farm_id => 1,
        :expense_type => "Expense Type",
        :expense_name => "Expense Name",
        :expense_amount => 1.5,
        :expense_year => "Expense Year"
      )
    ])
  end

  it "renders a list of farmexpenses" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Expense Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Expense Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Expense Year".to_s, :count => 2
  end
end
