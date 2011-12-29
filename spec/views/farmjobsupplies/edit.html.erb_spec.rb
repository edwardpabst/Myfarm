require 'spec_helper'

describe "farmjobsupplies/edit.html.erb" do
  before(:each) do
    @farmjobsupply = assign(:farmjobsupply, stub_model(Farmjobsupply,
      :new_record? => false,
      :user_id => 1,
      :farmjob_id => 1,
      :supply_id => 1,
      :actual_qty => 1.5
    ))
  end

  it "renders the edit farmjobsupply form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => farmjobsupply_path(@farmjobsupply), :method => "post" do
      assert_select "input#farmjobsupply_user_id", :name => "farmjobsupply[user_id]"
      assert_select "input#farmjobsupply_farmjob_id", :name => "farmjobsupply[farmjob_id]"
      assert_select "input#farmjobsupply_supply_id", :name => "farmjobsupply[supply_id]"
      assert_select "input#farmjobsupply_actual_qty", :name => "farmjobsupply[actual_qty]"
    end
  end
end
