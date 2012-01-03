require 'spec_helper'

describe "fields/index.html.erb" do
  before(:each) do
    assign(:fields, [
      stub_model(Field,
        :user_id => 1,
        :farmname => "Farmname",
        :client_id => 1,
        :location => "Location",
        :country => "Country",
        :number_acres => "",
        :holding_status => "Holding Status",
        :owner_id => 1,
        :area_mapped => "",
        :area_legal => "",
        :area_tillable => "",
        :current_state => "Current State"
      ),
      stub_model(Field,
        :user_id => 1,
        :farmname => "Farmname",
        :client_id => 1,
        :location => "Location",
        :country => "Country",
        :number_acres => "",
        :holding_status => "Holding Status",
        :owner_id => 1,
        :area_mapped => "",
        :area_legal => "",
        :area_tillable => "",
        :current_state => "Current State"
      )
    ])
  end

  it "renders a list of fields" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Farmname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Holding Status".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Current State".to_s, :count => 2
  end
end
