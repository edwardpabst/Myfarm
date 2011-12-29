require "spec_helper"

describe PodetailsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/podetails" }.should route_to(:controller => "podetails", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/podetails/new" }.should route_to(:controller => "podetails", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/podetails/1" }.should route_to(:controller => "podetails", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/podetails/1/edit" }.should route_to(:controller => "podetails", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/podetails" }.should route_to(:controller => "podetails", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/podetails/1" }.should route_to(:controller => "podetails", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/podetails/1" }.should route_to(:controller => "podetails", :action => "destroy", :id => "1")
    end

  end
end
