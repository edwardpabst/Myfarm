require 'spec_helper'

describe "capitalrecoveries/index.html.erb" do
  before(:each) do
    assign(:capitalrecoveries, [
      stub_model(Capitalrecovery,
        :recovery_year => 1,
        :interest_rate => 1,
        :recovery_factor => "9.99"
      ),
      stub_model(Capitalrecovery,
        :recovery_year => 1,
        :interest_rate => 1,
        :recovery_factor => "9.99"
      )
    ])
  end

  it "renders a list of capitalrecoveries" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
