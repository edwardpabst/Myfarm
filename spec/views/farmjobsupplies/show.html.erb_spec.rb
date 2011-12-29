require 'spec_helper'

describe "farmjobsupplies/show.html.erb" do
  before(:each) do
    @farmjobsupply = assign(:farmjobsupply, stub_model(Farmjobsupply,
      :user_id => 1,
      :farmjob_id => 1,
      :supply_id => 1,
      :actual_qty => 1.5
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
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
