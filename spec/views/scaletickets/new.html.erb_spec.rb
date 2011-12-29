require 'spec_helper'

describe "scaletickets/new.html.erb" do
  before(:each) do
    assign(:scaleticket, stub_model(Scaleticket,
      :cropplan_id => 1,
      :pack_qty => 1.5,
      :weight_uom => "MyString",
      :gross_weight => 1.5,
      :tare_weight => 1.5,
      :net_weight => 1.5,
      :moisture_pct => 1.5,
      :party_id => 1
    ).as_new_record)
  end

  it "renders new scaleticket form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => scaletickets_path, :method => "post" do
      assert_select "input#scaleticket_cropplan_id", :name => "scaleticket[cropplan_id]"
      assert_select "input#scaleticket_pack_qty", :name => "scaleticket[pack_qty]"
      assert_select "input#scaleticket_weight_uom", :name => "scaleticket[weight_uom]"
      assert_select "input#scaleticket_gross_weight", :name => "scaleticket[gross_weight]"
      assert_select "input#scaleticket_tare_weight", :name => "scaleticket[tare_weight]"
      assert_select "input#scaleticket_net_weight", :name => "scaleticket[net_weight]"
      assert_select "input#scaleticket_moisture_pct", :name => "scaleticket[moisture_pct]"
      assert_select "input#scaleticket_party_id", :name => "scaleticket[party_id]"
    end
  end
end
