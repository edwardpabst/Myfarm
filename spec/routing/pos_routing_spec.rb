require "spec_helper"

describe PosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pos" }.should route_to(:controller => "pos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pos/new" }.should route_to(:controller => "pos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pos/1" }.should route_to(:controller => "pos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pos/1/edit" }.should route_to(:controller => "pos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pos" }.should route_to(:controller => "pos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pos/1" }.should route_to(:controller => "pos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pos/1" }.should route_to(:controller => "pos", :action => "destroy", :id => "1")
    end

  end
end
