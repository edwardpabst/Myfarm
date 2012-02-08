require "spec_helper"

describe InventoryticketsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/inventorytickets" }.should route_to(:controller => "inventorytickets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/inventorytickets/new" }.should route_to(:controller => "inventorytickets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/inventorytickets/1" }.should route_to(:controller => "inventorytickets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/inventorytickets/1/edit" }.should route_to(:controller => "inventorytickets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/inventorytickets" }.should route_to(:controller => "inventorytickets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/inventorytickets/1" }.should route_to(:controller => "inventorytickets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/inventorytickets/1" }.should route_to(:controller => "inventorytickets", :action => "destroy", :id => "1")
    end

  end
end
