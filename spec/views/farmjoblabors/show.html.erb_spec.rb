require 'spec_helper'

describe "farmjoblabors/show.html.erb" do
  before(:each) do
    @farmjoblabor = assign(:farmjoblabor, stub_model(Farmjoblabor,
      :user_id => 1,
      :farmjob_id => 1,
      :party_id => 1,
      :task_hours => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
