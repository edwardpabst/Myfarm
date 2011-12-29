require "spec_helper"

describe ShipmentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/shipments" }.should route_to(:controller => "shipments", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/shipments/new" }.should route_to(:controller => "shipments", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/shipments/1" }.should route_to(:controller => "shipments", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/shipments/1/edit" }.should route_to(:controller => "shipments", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/shipments" }.should route_to(:controller => "shipments", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/shipments/1" }.should route_to(:controller => "shipments", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/shipments/1" }.should route_to(:controller => "shipments", :action => "destroy", :id => "1")
    end

  end
end
