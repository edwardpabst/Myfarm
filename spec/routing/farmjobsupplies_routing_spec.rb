require "spec_helper"

describe FarmjobsuppliesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/farmjobsupplies" }.should route_to(:controller => "farmjobsupplies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/farmjobsupplies/new" }.should route_to(:controller => "farmjobsupplies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/farmjobsupplies/1" }.should route_to(:controller => "farmjobsupplies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/farmjobsupplies/1/edit" }.should route_to(:controller => "farmjobsupplies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/farmjobsupplies" }.should route_to(:controller => "farmjobsupplies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/farmjobsupplies/1" }.should route_to(:controller => "farmjobsupplies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/farmjobsupplies/1" }.should route_to(:controller => "farmjobsupplies", :action => "destroy", :id => "1")
    end

  end
end
