require 'spec_helper'

describe CropplansController do

  def mock_cropplan(stubs={})
    (@mock_cropplan ||= mock_model(Cropplan).as_null_object).tap do |cropplan|
      cropplan.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all cropplans as @cropplans" do
      Cropplan.stub(:all) { [mock_cropplan] }
      get :index
      assigns(:cropplans).should eq([mock_cropplan])
    end
  end

  describe "GET show" do
    it "assigns the requested cropplan as @cropplan" do
      Cropplan.stub(:find).with("37") { mock_cropplan }
      get :show, :id => "37"
      assigns(:cropplan).should be(mock_cropplan)
    end
  end

  describe "GET new" do
    it "assigns a new cropplan as @cropplan" do
      Cropplan.stub(:new) { mock_cropplan }
      get :new
      assigns(:cropplan).should be(mock_cropplan)
    end
  end

  describe "GET edit" do
    it "assigns the requested cropplan as @cropplan" do
      Cropplan.stub(:find).with("37") { mock_cropplan }
      get :edit, :id => "37"
      assigns(:cropplan).should be(mock_cropplan)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created cropplan as @cropplan" do
        Cropplan.stub(:new).with({'these' => 'params'}) { mock_cropplan(:save => true) }
        post :create, :cropplan => {'these' => 'params'}
        assigns(:cropplan).should be(mock_cropplan)
      end

      it "redirects to the created cropplan" do
        Cropplan.stub(:new) { mock_cropplan(:save => true) }
        post :create, :cropplan => {}
        response.should redirect_to(cropplan_url(mock_cropplan))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cropplan as @cropplan" do
        Cropplan.stub(:new).with({'these' => 'params'}) { mock_cropplan(:save => false) }
        post :create, :cropplan => {'these' => 'params'}
        assigns(:cropplan).should be(mock_cropplan)
      end

      it "re-renders the 'new' template" do
        Cropplan.stub(:new) { mock_cropplan(:save => false) }
        post :create, :cropplan => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested cropplan" do
        Cropplan.should_receive(:find).with("37") { mock_cropplan }
        mock_cropplan.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cropplan => {'these' => 'params'}
      end

      it "assigns the requested cropplan as @cropplan" do
        Cropplan.stub(:find) { mock_cropplan(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cropplan).should be(mock_cropplan)
      end

      it "redirects to the cropplan" do
        Cropplan.stub(:find) { mock_cropplan(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cropplan_url(mock_cropplan))
      end
    end

    describe "with invalid params" do
      it "assigns the cropplan as @cropplan" do
        Cropplan.stub(:find) { mock_cropplan(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cropplan).should be(mock_cropplan)
      end

      it "re-renders the 'edit' template" do
        Cropplan.stub(:find) { mock_cropplan(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested cropplan" do
      Cropplan.should_receive(:find).with("37") { mock_cropplan }
      mock_cropplan.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cropplans list" do
      Cropplan.stub(:find) { mock_cropplan }
      delete :destroy, :id => "1"
      response.should redirect_to(cropplans_url)
    end
  end

end
