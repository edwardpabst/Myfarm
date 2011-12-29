require "spec_helper"

describe SupplyinventoriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/supplyinventories" }.should route_to(:controller => "supplyinventories", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/supplyinventories/new" }.should route_to(:controller => "supplyinventories", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/supplyinventories/1" }.should route_to(:controller => "supplyinventories", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/supplyinventories/1/edit" }.should route_to(:controller => "supplyinventories", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/supplyinventories" }.should route_to(:controller => "supplyinventories", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/supplyinventories/1" }.should route_to(:controller => "supplyinventories", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/supplyinventories/1" }.should route_to(:controller => "supplyinventories", :action => "destroy", :id => "1")
    end

  end
end
