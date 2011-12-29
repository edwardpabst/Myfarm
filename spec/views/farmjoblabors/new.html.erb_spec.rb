require 'spec_helper'

describe "farmjoblabors/new.html.erb" do
  before(:each) do
    assign(:farmjoblabor, stub_model(Farmjoblabor,
      :user_id => 1,
      :farmjob_id => 1,
      :party_id => 1,
      :task_hours => 1.5
    ).as_new_record)
  end

  it "renders new farmjoblabor form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => farmjoblabors_path, :method => "post" do
      assert_select "input#farmjoblabor_user_id", :name => "farmjoblabor[user_id]"
      assert_select "input#farmjoblabor_farmjob_id", :name => "farmjoblabor[farmjob_id]"
      assert_select "input#farmjoblabor_party_id", :name => "farmjoblabor[party_id]"
      assert_select "input#farmjoblabor_task_hours", :name => "farmjoblabor[task_hours]"
    end
  end
end
