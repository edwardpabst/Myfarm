require 'spec_helper'

describe "farmjobequipments/edit.html.erb" do
  before(:each) do
    @farmjobequipment = assign(:farmjobequipment, stub_model(Farmjobequipment,
      :new_record? => false,
      :user_id => 1,
      :farmjob_id => 1,
      :equipment_id => 1,
      :qty_required => 1.5,
      :qty_actaul => 1.5,
      :additional_cost => 1.5
    ))
  end

  it "renders the edit farmjobequipment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => farmjobequipment_path(@farmjobequipment), :method => "post" do
      assert_select "input#farmjobequipment_user_id", :name => "farmjobequipment[user_id]"
      assert_select "input#farmjobequipment_farmjob_id", :name => "farmjobequipment[farmjob_id]"
      assert_select "input#farmjobequipment_equipment_id", :name => "farmjobequipment[equipment_id]"
      assert_select "input#farmjobequipment_qty_required", :name => "farmjobequipment[qty_required]"
      assert_select "input#farmjobequipment_qty_actaul", :name => "farmjobequipment[qty_actaul]"
      assert_select "input#farmjobequipment_additional_cost", :name => "farmjobequipment[additional_cost]"
    end
  end
end
