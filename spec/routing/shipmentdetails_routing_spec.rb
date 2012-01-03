require "spec_helper"

describe ShipmentdetailsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/shipmentdetails" }.should route_to(:controller => "shipmentdetails", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/shipmentdetails/new" }.should route_to(:controller => "shipmentdetails", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/shipmentdetails/1" }.should route_to(:controller => "shipmentdetails", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/shipmentdetails/1/edit" }.should route_to(:controller => "shipmentdetails", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/shipmentdetails" }.should route_to(:controller => "shipmentdetails", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/shipmentdetails/1" }.should route_to(:controller => "shipmentdetails", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/shipmentdetails/1" }.should route_to(:controller => "shipmentdetails", :action => "destroy", :id => "1")
    end

  end
end
