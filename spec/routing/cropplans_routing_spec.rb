require "spec_helper"

describe CropplansController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cropplans" }.should route_to(:controller => "cropplans", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cropplans/new" }.should route_to(:controller => "cropplans", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cropplans/1" }.should route_to(:controller => "cropplans", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cropplans/1/edit" }.should route_to(:controller => "cropplans", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cropplans" }.should route_to(:controller => "cropplans", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cropplans/1" }.should route_to(:controller => "cropplans", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cropplans/1" }.should route_to(:controller => "cropplans", :action => "destroy", :id => "1")
    end

  end
end
