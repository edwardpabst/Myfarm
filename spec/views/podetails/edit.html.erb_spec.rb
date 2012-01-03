require 'spec_helper'

describe "podetails/edit.html.erb" do
  before(:each) do
    @podetail = assign(:podetail, stub_model(Podetail,
      :new_record? => false,
      :po_id => 1,
      :user_id => 1,
      :supply_id => 1,
      :storage_id => 1,
      :qty_ordered => 1.5,
      :supply_uom => 1,
      :order_price => 1.5,
      :ext_amount => 1.5,
      :detail_status => "MyString",
      :qty_received => 1.5,
      :receipt_amount => 1.5
    ))
  end

  it "renders the edit podetail form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => podetail_path(@podetail), :method => "post" do
      assert_select "input#podetail_po_id", :name => "podetail[po_id]"
      assert_select "input#podetail_user_id", :name => "podetail[user_id]"
      assert_select "input#podetail_supply_id", :name => "podetail[supply_id]"
      assert_select "input#podetail_storage_id", :name => "podetail[storage_id]"
      assert_select "input#podetail_qty_ordered", :name => "podetail[qty_ordered]"
      assert_select "input#podetail_supply_uom", :name => "podetail[supply_uom]"
      assert_select "input#podetail_order_price", :name => "podetail[order_price]"
      assert_select "input#podetail_ext_amount", :name => "podetail[ext_amount]"
      assert_select "input#podetail_detail_status", :name => "podetail[detail_status]"
      assert_select "input#podetail_qty_received", :name => "podetail[qty_received]"
      assert_select "input#podetail_receipt_amount", :name => "podetail[receipt_amount]"
    end
  end
end
