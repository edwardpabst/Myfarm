require 'spec_helper'

describe RetailorderdetailsController do

  def mock_retailorderdetail(stubs={})
    (@mock_retailorderdetail ||= mock_model(Retailorderdetail).as_null_object).tap do |retailorderdetail|
      retailorderdetail.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all retailorderdetails as @retailorderdetails" do
      Retailorderdetail.stub(:all) { [mock_retailorderdetail] }
      get :index
      assigns(:retailorderdetails).should eq([mock_retailorderdetail])
    end
  end

  describe "GET show" do
    it "assigns the requested retailorderdetail as @retailorderdetail" do
      Retailorderdetail.stub(:find).with("37") { mock_retailorderdetail }
      get :show, :id => "37"
      assigns(:retailorderdetail).should be(mock_retailorderdetail)
    end
  end

  describe "GET new" do
    it "assigns a new retailorderdetail as @retailorderdetail" do
      Retailorderdetail.stub(:new) { mock_retailorderdetail }
      get :new
      assigns(:retailorderdetail).should be(mock_retailorderdetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested retailorderdetail as @retailorderdetail" do
      Retailorderdetail.stub(:find).with("37") { mock_retailorderdetail }
      get :edit, :id => "37"
      assigns(:retailorderdetail).should be(mock_retailorderdetail)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created retailorderdetail as @retailorderdetail" do
        Retailorderdetail.stub(:new).with({'these' => 'params'}) { mock_retailorderdetail(:save => true) }
        post :create, :retailorderdetail => {'these' => 'params'}
        assigns(:retailorderdetail).should be(mock_retailorderdetail)
      end

      it "redirects to the created retailorderdetail" do
        Retailorderdetail.stub(:new) { mock_retailorderdetail(:save => true) }
        post :create, :retailorderdetail => {}
        response.should redirect_to(retailorderdetail_url(mock_retailorderdetail))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved retailorderdetail as @retailorderdetail" do
        Retailorderdetail.stub(:new).with({'these' => 'params'}) { mock_retailorderdetail(:save => false) }
        post :create, :retailorderdetail => {'these' => 'params'}
        assigns(:retailorderdetail).should be(mock_retailorderdetail)
      end

      it "re-renders the 'new' template" do
        Retailorderdetail.stub(:new) { mock_retailorderdetail(:save => false) }
        post :create, :retailorderdetail => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested retailorderdetail" do
        Retailorderdetail.should_receive(:find).with("37") { mock_retailorderdetail }
        mock_retailorderdetail.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :retailorderdetail => {'these' => 'params'}
      end

      it "assigns the requested retailorderdetail as @retailorderdetail" do
        Retailorderdetail.stub(:find) { mock_retailorderdetail(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:retailorderdetail).should be(mock_retailorderdetail)
      end

      it "redirects to the retailorderdetail" do
        Retailorderdetail.stub(:find) { mock_retailorderdetail(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(retailorderdetail_url(mock_retailorderdetail))
      end
    end

    describe "with invalid params" do
      it "assigns the retailorderdetail as @retailorderdetail" do
        Retailorderdetail.stub(:find) { mock_retailorderdetail(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:retailorderdetail).should be(mock_retailorderdetail)
      end

      it "re-renders the 'edit' template" do
        Retailorderdetail.stub(:find) { mock_retailorderdetail(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested retailorderdetail" do
      Retailorderdetail.should_receive(:find).with("37") { mock_retailorderdetail }
      mock_retailorderdetail.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the retailorderdetails list" do
      Retailorderdetail.stub(:find) { mock_retailorderdetail }
      delete :destroy, :id => "1"
      response.should redirect_to(retailorderdetails_url)
    end
  end

end
