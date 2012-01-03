require 'spec_helper'

describe CropsController do

  def mock_crop(stubs={})
    (@mock_crop ||= mock_model(Crop).as_null_object).tap do |crop|
      crop.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all crops as @crops" do
      Crop.stub(:all) { [mock_crop] }
      get :index
      assigns(:crops).should eq([mock_crop])
    end
  end

  describe "GET show" do
    it "assigns the requested crop as @crop" do
      Crop.stub(:find).with("37") { mock_crop }
      get :show, :id => "37"
      assigns(:crop).should be(mock_crop)
    end
  end

  describe "GET new" do
    it "assigns a new crop as @crop" do
      Crop.stub(:new) { mock_crop }
      get :new
      assigns(:crop).should be(mock_crop)
    end
  end

  describe "GET edit" do
    it "assigns the requested crop as @crop" do
      Crop.stub(:find).with("37") { mock_crop }
      get :edit, :id => "37"
      assigns(:crop).should be(mock_crop)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created crop as @crop" do
        Crop.stub(:new).with({'these' => 'params'}) { mock_crop(:save => true) }
        post :create, :crop => {'these' => 'params'}
        assigns(:crop).should be(mock_crop)
      end

      it "redirects to the created crop" do
        Crop.stub(:new) { mock_crop(:save => true) }
        post :create, :crop => {}
        response.should redirect_to(crop_url(mock_crop))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved crop as @crop" do
        Crop.stub(:new).with({'these' => 'params'}) { mock_crop(:save => false) }
        post :create, :crop => {'these' => 'params'}
        assigns(:crop).should be(mock_crop)
      end

      it "re-renders the 'new' template" do
        Crop.stub(:new) { mock_crop(:save => false) }
        post :create, :crop => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested crop" do
        Crop.should_receive(:find).with("37") { mock_crop }
        mock_crop.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :crop => {'these' => 'params'}
      end

      it "assigns the requested crop as @crop" do
        Crop.stub(:find) { mock_crop(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:crop).should be(mock_crop)
      end

      it "redirects to the crop" do
        Crop.stub(:find) { mock_crop(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(crop_url(mock_crop))
      end
    end

    describe "with invalid params" do
      it "assigns the crop as @crop" do
        Crop.stub(:find) { mock_crop(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:crop).should be(mock_crop)
      end

      it "re-renders the 'edit' template" do
        Crop.stub(:find) { mock_crop(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested crop" do
      Crop.should_receive(:find).with("37") { mock_crop }
      mock_crop.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the crops list" do
      Crop.stub(:find) { mock_crop }
      delete :destroy, :id => "1"
      response.should redirect_to(crops_url)
    end
  end

end
