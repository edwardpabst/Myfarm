require 'spec_helper'

describe "fieldtasks/show.html.erb" do
  before(:each) do
    @fieldtask = assign(:fieldtask, stub_model(Fieldtask,
      :user_id => 1,
      :task_type => "Task Type",
      :taskdescription => "Taskdescription",
      :task_notes => "Task Notes",
      :task_frequency_weeks => 1,
      :task_frequency_days => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Task Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Taskdescription/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Task Notes/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
