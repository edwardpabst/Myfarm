require 'spec_helper'

describe "fieldtasksupplies/show.html.erb" do
  before(:each) do
    @fieldtasksupply = assign(:fieldtasksupply, stub_model(Fieldtasksupply,
      :user_id => 1,
      :fieldtask_id => 1,
      :supply_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
