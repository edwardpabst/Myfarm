require 'spec_helper'

describe "farmexpenses/edit.html.erb" do
  before(:each) do
    @farmexpense = assign(:farmexpense, stub_model(Farmexpense,
      :new_record? => false,
      :farm_id => 1,
      :expense_type => "MyString",
      :expense_name => "MyString",
      :expense_amount => 1.5,
      :expense_year => "MyString"
    ))
  end

  it "renders the edit farmexpense form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => farmexpense_path(@farmexpense), :method => "post" do
      assert_select "input#farmexpense_farm_id", :name => "farmexpense[farm_id]"
      assert_select "input#farmexpense_expense_type", :name => "farmexpense[expense_type]"
      assert_select "input#farmexpense_expense_name", :name => "farmexpense[expense_name]"
      assert_select "input#farmexpense_expense_amount", :name => "farmexpense[expense_amount]"
      assert_select "input#farmexpense_expense_year", :name => "farmexpense[expense_year]"
    end
  end
end
