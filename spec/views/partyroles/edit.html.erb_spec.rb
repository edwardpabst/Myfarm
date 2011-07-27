require 'spec_helper'

describe "partyroles/edit.html.erb" do
  before(:each) do
    @partyrole = assign(:partyrole, stub_model(Partyrole,
      :new_record? => false,
      :party_id => 1,
      :partytype_id => 1
    ))
  end

  it "renders the edit partyrole form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => partyrole_path(@partyrole), :method => "post" do
      assert_select "input#partyrole_party_id", :name => "partyrole[party_id]"
      assert_select "input#partyrole_partytype_id", :name => "partyrole[partytype_id]"
    end
  end
end
