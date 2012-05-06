require 'spec_helper'

describe RetailcropsController do

  def mock_retailcrop(stubs={})
    (@mock_retailcrop ||= mock_model(Retailcrop).as_null_object).tap do |retailcrop|
      retailcrop.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all retailcrops as @retailcrops" do
      Retailcrop.stub(:all) { [mock_retailcrop] }
      get :index
      assigns(:retailcrops).should eq([mock_retailcrop])
    end
  end

  describe "GET show" do
    it "assigns the requested retailcrop as @retailcrop" do
      Retailcrop.stub(:find).with("37") { mock_retailcrop }
      get :show, :id => "37"
      assigns(:retailcrop).should be(mock_retailcrop)
    end
  end

  describe "GET new" do
    it "assigns a new retailcrop as @retailcrop" do
      Retailcrop.stub(:new) { mock_retailcrop }
      get :new
      assigns(:retailcrop).should be(mock_retailcrop)
    end
  end

  describe "GET edit" do
    it "assigns the requested retailcrop as @retailcrop" do
      Retailcrop.stub(:find).with("37") { mock_retailcrop }
      get :edit, :id => "37"
      assigns(:retailcrop).should be(mock_retailcrop)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created retailcrop as @retailcrop" do
        Retailcrop.stub(:new).with({'these' => 'params'}) { mock_retailcrop(:save => true) }
        post :create, :retailcrop => {'these' => 'params'}
        assigns(:retailcrop).should be(mock_retailcrop)
      end

      it "redirects to the created retailcrop" do
        Retailcrop.stub(:new) { mock_retailcrop(:save => true) }
        post :create, :retailcrop => {}
        response.should redirect_to(retailcrop_url(mock_retailcrop))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved retailcrop as @retailcrop" do
        Retailcrop.stub(:new).with({'these' => 'params'}) { mock_retailcrop(:save => false) }
        post :create, :retailcrop => {'these' => 'params'}
        assigns(:retailcrop).should be(mock_retailcrop)
      end

      it "re-renders the 'new' template" do
        Retailcrop.stub(:new) { mock_retailcrop(:save => false) }
        post :create, :retailcrop => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested retailcrop" do
        Retailcrop.should_receive(:find).with("37") { mock_retailcrop }
        mock_retailcrop.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :retailcrop => {'these' => 'params'}
      end

      it "assigns the requested retailcrop as @retailcrop" do
        Retailcrop.stub(:find) { mock_retailcrop(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:retailcrop).should be(mock_retailcrop)
      end

      it "redirects to the retailcrop" do
        Retailcrop.stub(:find) { mock_retailcrop(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(retailcrop_url(mock_retailcrop))
      end
    end

    describe "with invalid params" do
      it "assigns the retailcrop as @retailcrop" do
        Retailcrop.stub(:find) { mock_retailcrop(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:retailcrop).should be(mock_retailcrop)
      end

      it "re-renders the 'edit' template" do
        Retailcrop.stub(:find) { mock_retailcrop(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested retailcrop" do
      Retailcrop.should_receive(:find).with("37") { mock_retailcrop }
      mock_retailcrop.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the retailcrops list" do
      Retailcrop.stub(:find) { mock_retailcrop }
      delete :destroy, :id => "1"
      response.should redirect_to(retailcrops_url)
    end
  end

end
