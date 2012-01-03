require 'spec_helper'

describe "farmjoblabors/index.html.erb" do
  before(:each) do
    assign(:farmjoblabors, [
      stub_model(Farmjoblabor,
        :user_id => 1,
        :farmjob_id => 1,
        :party_id => 1,
        :task_hours => 1.5
      ),
      stub_model(Farmjoblabor,
        :user_id => 1,
        :farmjob_id => 1,
        :party_id => 1,
        :task_hours => 1.5
      )
    ])
  end

  it "renders a list of farmjoblabors" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
