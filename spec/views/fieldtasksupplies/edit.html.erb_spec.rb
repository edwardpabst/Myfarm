require 'spec_helper'

describe "fieldtasksupplies/edit.html.erb" do
  before(:each) do
    @fieldtasksupply = assign(:fieldtasksupply, stub_model(Fieldtasksupply,
      :new_record? => false,
      :user_id => 1,
      :fieldtask_id => 1,
      :supply_id => 1
    ))
  end

  it "renders the edit fieldtasksupply form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fieldtasksupply_path(@fieldtasksupply), :method => "post" do
      assert_select "input#fieldtasksupply_user_id", :name => "fieldtasksupply[user_id]"
      assert_select "input#fieldtasksupply_fieldtask_id", :name => "fieldtasksupply[fieldtask_id]"
      assert_select "input#fieldtasksupply_supply_id", :name => "fieldtasksupply[supply_id]"
    end
  end
end
