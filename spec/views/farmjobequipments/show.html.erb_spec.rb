require 'spec_helper'

describe "farmjobequipments/show.html.erb" do
  before(:each) do
    @farmjobequipment = assign(:farmjobequipment, stub_model(Farmjobequipment,
      :user_id => 1,
      :farmjob_id => 1,
      :equipment_id => 1,
      :qty_required => 1.5,
      :qty_actaul => 1.5,
      :additional_cost => 1.5
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
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
