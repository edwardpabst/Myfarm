require "spec_helper"

describe CropplanfieldsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cropplanfields" }.should route_to(:controller => "cropplanfields", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cropplanfields/new" }.should route_to(:controller => "cropplanfields", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cropplanfields/1" }.should route_to(:controller => "cropplanfields", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cropplanfields/1/edit" }.should route_to(:controller => "cropplanfields", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cropplanfields" }.should route_to(:controller => "cropplanfields", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cropplanfields/1" }.should route_to(:controller => "cropplanfields", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cropplanfields/1" }.should route_to(:controller => "cropplanfields", :action => "destroy", :id => "1")
    end

  end
end
