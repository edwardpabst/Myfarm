require "spec_helper"

describe FarmjobsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/farmjobs" }.should route_to(:controller => "farmjobs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/farmjobs/new" }.should route_to(:controller => "farmjobs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/farmjobs/1" }.should route_to(:controller => "farmjobs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/farmjobs/1/edit" }.should route_to(:controller => "farmjobs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/farmjobs" }.should route_to(:controller => "farmjobs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/farmjobs/1" }.should route_to(:controller => "farmjobs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/farmjobs/1" }.should route_to(:controller => "farmjobs", :action => "destroy", :id => "1")
    end

  end
end
