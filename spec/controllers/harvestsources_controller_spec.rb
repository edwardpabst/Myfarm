require 'spec_helper'

describe HarvestsourcesController do

  def mock_harvestsource(stubs={})
    (@mock_harvestsource ||= mock_model(Harvestsource).as_null_object).tap do |harvestsource|
      harvestsource.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all harvestsources as @harvestsources" do
      Harvestsource.stub(:all) { [mock_harvestsource] }
      get :index
      assigns(:harvestsources).should eq([mock_harvestsource])
    end
  end

  describe "GET show" do
    it "assigns the requested harvestsource as @harvestsource" do
      Harvestsource.stub(:find).with("37") { mock_harvestsource }
      get :show, :id => "37"
      assigns(:harvestsource).should be(mock_harvestsource)
    end
  end

  describe "GET new" do
    it "assigns a new harvestsource as @harvestsource" do
      Harvestsource.stub(:new) { mock_harvestsource }
      get :new
      assigns(:harvestsource).should be(mock_harvestsource)
    end
  end

  describe "GET edit" do
    it "assigns the requested harvestsource as @harvestsource" do
      Harvestsource.stub(:find).with("37") { mock_harvestsource }
      get :edit, :id => "37"
      assigns(:harvestsource).should be(mock_harvestsource)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created harvestsource as @harvestsource" do
        Harvestsource.stub(:new).with({'these' => 'params'}) { mock_harvestsource(:save => true) }
        post :create, :harvestsource => {'these' => 'params'}
        assigns(:harvestsource).should be(mock_harvestsource)
      end

      it "redirects to the created harvestsource" do
        Harvestsource.stub(:new) { mock_harvestsource(:save => true) }
        post :create, :harvestsource => {}
        response.should redirect_to(harvestsource_url(mock_harvestsource))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved harvestsource as @harvestsource" do
        Harvestsource.stub(:new).with({'these' => 'params'}) { mock_harvestsource(:save => false) }
        post :create, :harvestsource => {'these' => 'params'}
        assigns(:harvestsource).should be(mock_harvestsource)
      end

      it "re-renders the 'new' template" do
        Harvestsource.stub(:new) { mock_harvestsource(:save => false) }
        post :create, :harvestsource => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested harvestsource" do
        Harvestsource.should_receive(:find).with("37") { mock_harvestsource }
        mock_harvestsource.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :harvestsource => {'these' => 'params'}
      end

      it "assigns the requested harvestsource as @harvestsource" do
        Harvestsource.stub(:find) { mock_harvestsource(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:harvestsource).should be(mock_harvestsource)
      end

      it "redirects to the harvestsource" do
        Harvestsource.stub(:find) { mock_harvestsource(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(harvestsource_url(mock_harvestsource))
      end
    end

    describe "with invalid params" do
      it "assigns the harvestsource as @harvestsource" do
        Harvestsource.stub(:find) { mock_harvestsource(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:harvestsource).should be(mock_harvestsource)
      end

      it "re-renders the 'edit' template" do
        Harvestsource.stub(:find) { mock_harvestsource(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested harvestsource" do
      Harvestsource.should_receive(:find).with("37") { mock_harvestsource }
      mock_harvestsource.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the harvestsources list" do
      Harvestsource.stub(:find) { mock_harvestsource }
      delete :destroy, :id => "1"
      response.should redirect_to(harvestsources_url)
    end
  end

end
