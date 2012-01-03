require 'spec_helper'

describe ShipmentdetailsController do

  def mock_shipmentdetail(stubs={})
    (@mock_shipmentdetail ||= mock_model(Shipmentdetail).as_null_object).tap do |shipmentdetail|
      shipmentdetail.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all shipmentdetails as @shipmentdetails" do
      Shipmentdetail.stub(:all) { [mock_shipmentdetail] }
      get :index
      assigns(:shipmentdetails).should eq([mock_shipmentdetail])
    end
  end

  describe "GET show" do
    it "assigns the requested shipmentdetail as @shipmentdetail" do
      Shipmentdetail.stub(:find).with("37") { mock_shipmentdetail }
      get :show, :id => "37"
      assigns(:shipmentdetail).should be(mock_shipmentdetail)
    end
  end

  describe "GET new" do
    it "assigns a new shipmentdetail as @shipmentdetail" do
      Shipmentdetail.stub(:new) { mock_shipmentdetail }
      get :new
      assigns(:shipmentdetail).should be(mock_shipmentdetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested shipmentdetail as @shipmentdetail" do
      Shipmentdetail.stub(:find).with("37") { mock_shipmentdetail }
      get :edit, :id => "37"
      assigns(:shipmentdetail).should be(mock_shipmentdetail)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created shipmentdetail as @shipmentdetail" do
        Shipmentdetail.stub(:new).with({'these' => 'params'}) { mock_shipmentdetail(:save => true) }
        post :create, :shipmentdetail => {'these' => 'params'}
        assigns(:shipmentdetail).should be(mock_shipmentdetail)
      end

      it "redirects to the created shipmentdetail" do
        Shipmentdetail.stub(:new) { mock_shipmentdetail(:save => true) }
        post :create, :shipmentdetail => {}
        response.should redirect_to(shipmentdetail_url(mock_shipmentdetail))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shipmentdetail as @shipmentdetail" do
        Shipmentdetail.stub(:new).with({'these' => 'params'}) { mock_shipmentdetail(:save => false) }
        post :create, :shipmentdetail => {'these' => 'params'}
        assigns(:shipmentdetail).should be(mock_shipmentdetail)
      end

      it "re-renders the 'new' template" do
        Shipmentdetail.stub(:new) { mock_shipmentdetail(:save => false) }
        post :create, :shipmentdetail => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested shipmentdetail" do
        Shipmentdetail.should_receive(:find).with("37") { mock_shipmentdetail }
        mock_shipmentdetail.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :shipmentdetail => {'these' => 'params'}
      end

      it "assigns the requested shipmentdetail as @shipmentdetail" do
        Shipmentdetail.stub(:find) { mock_shipmentdetail(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:shipmentdetail).should be(mock_shipmentdetail)
      end

      it "redirects to the shipmentdetail" do
        Shipmentdetail.stub(:find) { mock_shipmentdetail(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(shipmentdetail_url(mock_shipmentdetail))
      end
    end

    describe "with invalid params" do
      it "assigns the shipmentdetail as @shipmentdetail" do
        Shipmentdetail.stub(:find) { mock_shipmentdetail(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:shipmentdetail).should be(mock_shipmentdetail)
      end

      it "re-renders the 'edit' template" do
        Shipmentdetail.stub(:find) { mock_shipmentdetail(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested shipmentdetail" do
      Shipmentdetail.should_receive(:find).with("37") { mock_shipmentdetail }
      mock_shipmentdetail.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the shipmentdetails list" do
      Shipmentdetail.stub(:find) { mock_shipmentdetail }
      delete :destroy, :id => "1"
      response.should redirect_to(shipmentdetails_url)
    end
  end

end
