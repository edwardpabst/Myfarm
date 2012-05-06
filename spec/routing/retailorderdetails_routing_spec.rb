require "spec_helper"

describe RetailorderdetailsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/retailorderdetails" }.should route_to(:controller => "retailorderdetails", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/retailorderdetails/new" }.should route_to(:controller => "retailorderdetails", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/retailorderdetails/1" }.should route_to(:controller => "retailorderdetails", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/retailorderdetails/1/edit" }.should route_to(:controller => "retailorderdetails", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/retailorderdetails" }.should route_to(:controller => "retailorderdetails", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/retailorderdetails/1" }.should route_to(:controller => "retailorderdetails", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/retailorderdetails/1" }.should route_to(:controller => "retailorderdetails", :action => "destroy", :id => "1")
    end

  end
end
