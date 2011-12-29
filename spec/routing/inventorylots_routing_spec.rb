require "spec_helper"

describe InventorylotsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/inventorylots" }.should route_to(:controller => "inventorylots", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/inventorylots/new" }.should route_to(:controller => "inventorylots", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/inventorylots/1" }.should route_to(:controller => "inventorylots", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/inventorylots/1/edit" }.should route_to(:controller => "inventorylots", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/inventorylots" }.should route_to(:controller => "inventorylots", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/inventorylots/1" }.should route_to(:controller => "inventorylots", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/inventorylots/1" }.should route_to(:controller => "inventorylots", :action => "destroy", :id => "1")
    end

  end
end
