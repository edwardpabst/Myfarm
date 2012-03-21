require 'spec_helper'

describe CropplanfieldsController do

  def mock_cropplanfield(stubs={})
    (@mock_cropplanfield ||= mock_model(Cropplanfield).as_null_object).tap do |cropplanfield|
      cropplanfield.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all cropplanfields as @cropplanfields" do
      Cropplanfield.stub(:all) { [mock_cropplanfield] }
      get :index
      assigns(:cropplanfields).should eq([mock_cropplanfield])
    end
  end

  describe "GET show" do
    it "assigns the requested cropplanfield as @cropplanfield" do
      Cropplanfield.stub(:find).with("37") { mock_cropplanfield }
      get :show, :id => "37"
      assigns(:cropplanfield).should be(mock_cropplanfield)
    end
  end

  describe "GET new" do
    it "assigns a new cropplanfield as @cropplanfield" do
      Cropplanfield.stub(:new) { mock_cropplanfield }
      get :new
      assigns(:cropplanfield).should be(mock_cropplanfield)
    end
  end

  describe "GET edit" do
    it "assigns the requested cropplanfield as @cropplanfield" do
      Cropplanfield.stub(:find).with("37") { mock_cropplanfield }
      get :edit, :id => "37"
      assigns(:cropplanfield).should be(mock_cropplanfield)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created cropplanfield as @cropplanfield" do
        Cropplanfield.stub(:new).with({'these' => 'params'}) { mock_cropplanfield(:save => true) }
        post :create, :cropplanfield => {'these' => 'params'}
        assigns(:cropplanfield).should be(mock_cropplanfield)
      end

      it "redirects to the created cropplanfield" do
        Cropplanfield.stub(:new) { mock_cropplanfield(:save => true) }
        post :create, :cropplanfield => {}
        response.should redirect_to(cropplanfield_url(mock_cropplanfield))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cropplanfield as @cropplanfield" do
        Cropplanfield.stub(:new).with({'these' => 'params'}) { mock_cropplanfield(:save => false) }
        post :create, :cropplanfield => {'these' => 'params'}
        assigns(:cropplanfield).should be(mock_cropplanfield)
      end

      it "re-renders the 'new' template" do
        Cropplanfield.stub(:new) { mock_cropplanfield(:save => false) }
        post :create, :cropplanfield => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested cropplanfield" do
        Cropplanfield.should_receive(:find).with("37") { mock_cropplanfield }
        mock_cropplanfield.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cropplanfield => {'these' => 'params'}
      end

      it "assigns the requested cropplanfield as @cropplanfield" do
        Cropplanfield.stub(:find) { mock_cropplanfield(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cropplanfield).should be(mock_cropplanfield)
      end

      it "redirects to the cropplanfield" do
        Cropplanfield.stub(:find) { mock_cropplanfield(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cropplanfield_url(mock_cropplanfield))
      end
    end

    describe "with invalid params" do
      it "assigns the cropplanfield as @cropplanfield" do
        Cropplanfield.stub(:find) { mock_cropplanfield(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cropplanfield).should be(mock_cropplanfield)
      end

      it "re-renders the 'edit' template" do
        Cropplanfield.stub(:find) { mock_cropplanfield(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested cropplanfield" do
      Cropplanfield.should_receive(:find).with("37") { mock_cropplanfield }
      mock_cropplanfield.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cropplanfields list" do
      Cropplanfield.stub(:find) { mock_cropplanfield }
      delete :destroy, :id => "1"
      response.should redirect_to(cropplanfields_url)
    end
  end

end
