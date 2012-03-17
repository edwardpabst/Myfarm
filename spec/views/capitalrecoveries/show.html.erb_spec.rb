require 'spec_helper'

describe "capitalrecoveries/show.html.erb" do
  before(:each) do
    @capitalrecovery = assign(:capitalrecovery, stub_model(Capitalrecovery,
      :recovery_year => 1,
      :interest_rate => 1,
      :recovery_factor => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
