require 'spec_helper'

describe "fieldtasksupplies/new.html.erb" do
  before(:each) do
    assign(:fieldtasksupply, stub_model(Fieldtasksupply,
      :user_id => 1,
      :fieldtask_id => 1,
      :supply_id => 1
    ).as_new_record)
  end

  it "renders new fieldtasksupply form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fieldtasksupplies_path, :method => "post" do
      assert_select "input#fieldtasksupply_user_id", :name => "fieldtasksupply[user_id]"
      assert_select "input#fieldtasksupply_fieldtask_id", :name => "fieldtasksupply[fieldtask_id]"
      assert_select "input#fieldtasksupply_supply_id", :name => "fieldtasksupply[supply_id]"
    end
  end
end
