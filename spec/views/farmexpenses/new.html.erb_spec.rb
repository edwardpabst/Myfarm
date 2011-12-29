require 'spec_helper'

describe "farmexpenses/new.html.erb" do
  before(:each) do
    assign(:farmexpense, stub_model(Farmexpense,
      :farm_id => 1,
      :expense_type => "MyString",
      :expense_name => "MyString",
      :expense_amount => 1.5,
      :expense_year => "MyString"
    ).as_new_record)
  end

  it "renders new farmexpense form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => farmexpenses_path, :method => "post" do
      assert_select "input#farmexpense_farm_id", :name => "farmexpense[farm_id]"
      assert_select "input#farmexpense_expense_type", :name => "farmexpense[expense_type]"
      assert_select "input#farmexpense_expense_name", :name => "farmexpense[expense_name]"
      assert_select "input#farmexpense_expense_amount", :name => "farmexpense[expense_amount]"
      assert_select "input#farmexpense_expense_year", :name => "farmexpense[expense_year]"
    end
  end
end
