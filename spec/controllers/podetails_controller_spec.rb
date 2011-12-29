require 'spec_helper'

describe PodetailsController do

  def mock_podetail(stubs={})
    (@mock_podetail ||= mock_model(Podetail).as_null_object).tap do |podetail|
      podetail.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all podetails as @podetails" do
      Podetail.stub(:all) { [mock_podetail] }
      get :index
      assigns(:podetails).should eq([mock_podetail])
    end
  end

  describe "GET show" do
    it "assigns the requested podetail as @podetail" do
      Podetail.stub(:find).with("37") { mock_podetail }
      get :show, :id => "37"
      assigns(:podetail).should be(mock_podetail)
    end
  end

  describe "GET new" do
    it "assigns a new podetail as @podetail" do
      Podetail.stub(:new) { mock_podetail }
      get :new
      assigns(:podetail).should be(mock_podetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested podetail as @podetail" do
      Podetail.stub(:find).with("37") { mock_podetail }
      get :edit, :id => "37"
      assigns(:podetail).should be(mock_podetail)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created podetail as @podetail" do
        Podetail.stub(:new).with({'these' => 'params'}) { mock_podetail(:save => true) }
        post :create, :podetail => {'these' => 'params'}
        assigns(:podetail).should be(mock_podetail)
      end

      it "redirects to the created podetail" do
        Podetail.stub(:new) { mock_podetail(:save => true) }
        post :create, :podetail => {}
        response.should redirect_to(podetail_url(mock_podetail))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved podetail as @podetail" do
        Podetail.stub(:new).with({'these' => 'params'}) { mock_podetail(:save => false) }
        post :create, :podetail => {'these' => 'params'}
        assigns(:podetail).should be(mock_podetail)
      end

      it "re-renders the 'new' template" do
        Podetail.stub(:new) { mock_podetail(:save => false) }
        post :create, :podetail => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested podetail" do
        Podetail.should_receive(:find).with("37") { mock_podetail }
        mock_podetail.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :podetail => {'these' => 'params'}
      end

      it "assigns the requested podetail as @podetail" do
        Podetail.stub(:find) { mock_podetail(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:podetail).should be(mock_podetail)
      end

      it "redirects to the podetail" do
        Podetail.stub(:find) { mock_podetail(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(podetail_url(mock_podetail))
      end
    end

    describe "with invalid params" do
      it "assigns the podetail as @podetail" do
        Podetail.stub(:find) { mock_podetail(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:podetail).should be(mock_podetail)
      end

      it "re-renders the 'edit' template" do
        Podetail.stub(:find) { mock_podetail(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested podetail" do
      Podetail.should_receive(:find).with("37") { mock_podetail }
      mock_podetail.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the podetails list" do
      Podetail.stub(:find) { mock_podetail }
      delete :destroy, :id => "1"
      response.should redirect_to(podetails_url)
    end
  end

end
