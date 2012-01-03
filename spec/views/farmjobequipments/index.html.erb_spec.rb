require 'spec_helper'

describe "farmjobequipments/index.html.erb" do
  before(:each) do
    assign(:farmjobequipments, [
      stub_model(Farmjobequipment,
        :user_id => 1,
        :farmjob_id => 1,
        :equipment_id => 1,
        :qty_required => 1.5,
        :qty_actaul => 1.5,
        :additional_cost => 1.5
      ),
      stub_model(Farmjobequipment,
        :user_id => 1,
        :farmjob_id => 1,
        :equipment_id => 1,
        :qty_required => 1.5,
        :qty_actaul => 1.5,
        :additional_cost => 1.5
      )
    ])
  end

  it "renders a list of farmjobequipments" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
