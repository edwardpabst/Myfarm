require 'spec_helper'

describe "partyroles/new.html.erb" do
  before(:each) do
    assign(:partyrole, stub_model(Partyrole,
      :party_id => 1,
      :partytype_id => 1
    ).as_new_record)
  end

  it "renders new partyrole form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => partyroles_path, :method => "post" do
      assert_select "input#partyrole_party_id", :name => "partyrole[party_id]"
      assert_select "input#partyrole_partytype_id", :name => "partyrole[partytype_id]"
    end
  end
end
