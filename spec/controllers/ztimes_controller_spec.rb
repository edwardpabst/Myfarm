require 'spec_helper'

describe ZtimesController do

  def mock_ztime(stubs={})
    (@mock_ztime ||= mock_model(Ztime).as_null_object).tap do |ztime|
      ztime.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all ztimes as @ztimes" do
      Ztime.stub(:all) { [mock_ztime] }
      get :index
      assigns(:ztimes).should eq([mock_ztime])
    end
  end

  describe "GET show" do
    it "assigns the requested ztime as @ztime" do
      Ztime.stub(:find).with("37") { mock_ztime }
      get :show, :id => "37"
      assigns(:ztime).should be(mock_ztime)
    end
  end

  describe "GET new" do
    it "assigns a new ztime as @ztime" do
      Ztime.stub(:new) { mock_ztime }
      get :new
      assigns(:ztime).should be(mock_ztime)
    end
  end

  describe "GET edit" do
    it "assigns the requested ztime as @ztime" do
      Ztime.stub(:find).with("37") { mock_ztime }
      get :edit, :id => "37"
      assigns(:ztime).should be(mock_ztime)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created ztime as @ztime" do
        Ztime.stub(:new).with({'these' => 'params'}) { mock_ztime(:save => true) }
        post :create, :ztime => {'these' => 'params'}
        assigns(:ztime).should be(mock_ztime)
      end

      it "redirects to the created ztime" do
        Ztime.stub(:new) { mock_ztime(:save => true) }
        post :create, :ztime => {}
        response.should redirect_to(ztime_url(mock_ztime))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ztime as @ztime" do
        Ztime.stub(:new).with({'these' => 'params'}) { mock_ztime(:save => false) }
        post :create, :ztime => {'these' => 'params'}
        assigns(:ztime).should be(mock_ztime)
      end

      it "re-renders the 'new' template" do
        Ztime.stub(:new) { mock_ztime(:save => false) }
        post :create, :ztime => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested ztime" do
        Ztime.should_receive(:find).with("37") { mock_ztime }
        mock_ztime.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ztime => {'these' => 'params'}
      end

      it "assigns the requested ztime as @ztime" do
        Ztime.stub(:find) { mock_ztime(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:ztime).should be(mock_ztime)
      end

      it "redirects to the ztime" do
        Ztime.stub(:find) { mock_ztime(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(ztime_url(mock_ztime))
      end
    end

    describe "with invalid params" do
      it "assigns the ztime as @ztime" do
        Ztime.stub(:find) { mock_ztime(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:ztime).should be(mock_ztime)
      end

      it "re-renders the 'edit' template" do
        Ztime.stub(:find) { mock_ztime(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested ztime" do
      Ztime.should_receive(:find).with("37") { mock_ztime }
      mock_ztime.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ztimes list" do
      Ztime.stub(:find) { mock_ztime }
      delete :destroy, :id => "1"
      response.should redirect_to(ztimes_url)
    end
  end

end
