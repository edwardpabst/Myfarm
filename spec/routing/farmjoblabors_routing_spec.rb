require "spec_helper"

describe FarmjoblaborsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/farmjoblabors" }.should route_to(:controller => "farmjoblabors", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/farmjoblabors/new" }.should route_to(:controller => "farmjoblabors", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/farmjoblabors/1" }.should route_to(:controller => "farmjoblabors", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/farmjoblabors/1/edit" }.should route_to(:controller => "farmjoblabors", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/farmjoblabors" }.should route_to(:controller => "farmjoblabors", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/farmjoblabors/1" }.should route_to(:controller => "farmjoblabors", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/farmjoblabors/1" }.should route_to(:controller => "farmjoblabors", :action => "destroy", :id => "1")
    end

  end
end
