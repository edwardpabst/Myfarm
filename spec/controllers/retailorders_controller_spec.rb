require 'spec_helper'

describe RetailordersController do

  def mock_retailorder(stubs={})
    (@mock_retailorder ||= mock_model(Retailorder).as_null_object).tap do |retailorder|
      retailorder.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all retailorders as @retailorders" do
      Retailorder.stub(:all) { [mock_retailorder] }
      get :index
      assigns(:retailorders).should eq([mock_retailorder])
    end
  end

  describe "GET show" do
    it "assigns the requested retailorder as @retailorder" do
      Retailorder.stub(:find).with("37") { mock_retailorder }
      get :show, :id => "37"
      assigns(:retailorder).should be(mock_retailorder)
    end
  end

  describe "GET new" do
    it "assigns a new retailorder as @retailorder" do
      Retailorder.stub(:new) { mock_retailorder }
      get :new
      assigns(:retailorder).should be(mock_retailorder)
    end
  end

  describe "GET edit" do
    it "assigns the requested retailorder as @retailorder" do
      Retailorder.stub(:find).with("37") { mock_retailorder }
      get :edit, :id => "37"
      assigns(:retailorder).should be(mock_retailorder)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created retailorder as @retailorder" do
        Retailorder.stub(:new).with({'these' => 'params'}) { mock_retailorder(:save => true) }
        post :create, :retailorder => {'these' => 'params'}
        assigns(:retailorder).should be(mock_retailorder)
      end

      it "redirects to the created retailorder" do
        Retailorder.stub(:new) { mock_retailorder(:save => true) }
        post :create, :retailorder => {}
        response.should redirect_to(retailorder_url(mock_retailorder))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved retailorder as @retailorder" do
        Retailorder.stub(:new).with({'these' => 'params'}) { mock_retailorder(:save => false) }
        post :create, :retailorder => {'these' => 'params'}
        assigns(:retailorder).should be(mock_retailorder)
      end

      it "re-renders the 'new' template" do
        Retailorder.stub(:new) { mock_retailorder(:save => false) }
        post :create, :retailorder => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested retailorder" do
        Retailorder.should_receive(:find).with("37") { mock_retailorder }
        mock_retailorder.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :retailorder => {'these' => 'params'}
      end

      it "assigns the requested retailorder as @retailorder" do
        Retailorder.stub(:find) { mock_retailorder(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:retailorder).should be(mock_retailorder)
      end

      it "redirects to the retailorder" do
        Retailorder.stub(:find) { mock_retailorder(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(retailorder_url(mock_retailorder))
      end
    end

    describe "with invalid params" do
      it "assigns the retailorder as @retailorder" do
        Retailorder.stub(:find) { mock_retailorder(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:retailorder).should be(mock_retailorder)
      end

      it "re-renders the 'edit' template" do
        Retailorder.stub(:find) { mock_retailorder(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested retailorder" do
      Retailorder.should_receive(:find).with("37") { mock_retailorder }
      mock_retailorder.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the retailorders list" do
      Retailorder.stub(:find) { mock_retailorder }
      delete :destroy, :id => "1"
      response.should redirect_to(retailorders_url)
    end
  end

end
