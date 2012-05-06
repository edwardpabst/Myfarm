require 'spec_helper'

describe "retailorderdetails/new.html.erb" do
  before(:each) do
    assign(:retailorderdetail, stub_model(Retailorderdetail,
      :user_id => 1,
      :retailcrop_id => 1,
      :cropplan_id => 1,
      :detail_uom => "MyString",
      :detail_price => "9.99",
      :detail_qty => "9.99",
      :detail_ext_amount => "9.99",
      :detail_shipcharge => "9.99",
      :detail_status => "MyString"
    ).as_new_record)
  end

  it "renders new retailorderdetail form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => retailorderdetails_path, :method => "post" do
      assert_select "input#retailorderdetail_user_id", :name => "retailorderdetail[user_id]"
      assert_select "input#retailorderdetail_retailcrop_id", :name => "retailorderdetail[retailcrop_id]"
      assert_select "input#retailorderdetail_cropplan_id", :name => "retailorderdetail[cropplan_id]"
      assert_select "input#retailorderdetail_detail_uom", :name => "retailorderdetail[detail_uom]"
      assert_select "input#retailorderdetail_detail_price", :name => "retailorderdetail[detail_price]"
      assert_select "input#retailorderdetail_detail_qty", :name => "retailorderdetail[detail_qty]"
      assert_select "input#retailorderdetail_detail_ext_amount", :name => "retailorderdetail[detail_ext_amount]"
      assert_select "input#retailorderdetail_detail_shipcharge", :name => "retailorderdetail[detail_shipcharge]"
      assert_select "input#retailorderdetail_detail_status", :name => "retailorderdetail[detail_status]"
    end
  end
end
