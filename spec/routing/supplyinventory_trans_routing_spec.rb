require "spec_helper"

describe SupplyinventoryTransController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/supplyinventory_trans" }.should route_to(:controller => "supplyinventory_trans", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/supplyinventory_trans/new" }.should route_to(:controller => "supplyinventory_trans", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/supplyinventory_trans/1" }.should route_to(:controller => "supplyinventory_trans", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/supplyinventory_trans/1/edit" }.should route_to(:controller => "supplyinventory_trans", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/supplyinventory_trans" }.should route_to(:controller => "supplyinventory_trans", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/supplyinventory_trans/1" }.should route_to(:controller => "supplyinventory_trans", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/supplyinventory_trans/1" }.should route_to(:controller => "supplyinventory_trans", :action => "destroy", :id => "1")
    end

  end
end
