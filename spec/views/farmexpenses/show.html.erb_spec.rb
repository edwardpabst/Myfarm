require 'spec_helper'

describe "farmexpenses/show.html.erb" do
  before(:each) do
    @farmexpense = assign(:farmexpense, stub_model(Farmexpense,
      :farm_id => 1,
      :expense_type => "Expense Type",
      :expense_name => "Expense Name",
      :expense_amount => 1.5,
      :expense_year => "Expense Year"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Expense Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Expense Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Expense Year/)
  end
end
