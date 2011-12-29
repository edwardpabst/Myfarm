require 'spec_helper'

describe "fields/new.html.erb" do
  before(:each) do
    assign(:field, stub_model(Field,
      :user_id => 1,
      :farmname => "MyString",
      :client_id => 1,
      :location => "MyString",
      :country => "MyString",
      :number_acres => "",
      :holding_status => "MyString",
      :owner_id => 1,
      :area_mapped => "",
      :area_legal => "",
      :area_tillable => "",
      :current_state => "MyString"
    ).as_new_record)
  end

  it "renders new field form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fields_path, :method => "post" do
      assert_select "input#field_user_id", :name => "field[user_id]"
      assert_select "input#field_farmname", :name => "field[farmname]"
      assert_select "input#field_client_id", :name => "field[client_id]"
      assert_select "input#field_location", :name => "field[location]"
      assert_select "input#field_country", :name => "field[country]"
      assert_select "input#field_number_acres", :name => "field[number_acres]"
      assert_select "input#field_holding_status", :name => "field[holding_status]"
      assert_select "input#field_owner_id", :name => "field[owner_id]"
      assert_select "input#field_area_mapped", :name => "field[area_mapped]"
      assert_select "input#field_area_legal", :name => "field[area_legal]"
      assert_select "input#field_area_tillable", :name => "field[area_tillable]"
      assert_select "input#field_current_state", :name => "field[current_state]"
    end
  end
end
