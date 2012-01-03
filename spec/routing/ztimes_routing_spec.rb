require "spec_helper"

describe ZtimesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/ztimes" }.should route_to(:controller => "ztimes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ztimes/new" }.should route_to(:controller => "ztimes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ztimes/1" }.should route_to(:controller => "ztimes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ztimes/1/edit" }.should route_to(:controller => "ztimes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ztimes" }.should route_to(:controller => "ztimes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/ztimes/1" }.should route_to(:controller => "ztimes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ztimes/1" }.should route_to(:controller => "ztimes", :action => "destroy", :id => "1")
    end

  end
end
