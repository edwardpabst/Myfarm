require "spec_helper"

describe CapitalrecoveriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/capitalrecoveries" }.should route_to(:controller => "capitalrecoveries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/capitalrecoveries/new" }.should route_to(:controller => "capitalrecoveries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/capitalrecoveries/1" }.should route_to(:controller => "capitalrecoveries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/capitalrecoveries/1/edit" }.should route_to(:controller => "capitalrecoveries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/capitalrecoveries" }.should route_to(:controller => "capitalrecoveries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/capitalrecoveries/1" }.should route_to(:controller => "capitalrecoveries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/capitalrecoveries/1" }.should route_to(:controller => "capitalrecoveries", :action => "destroy", :id => "1")
    end

  end
end
