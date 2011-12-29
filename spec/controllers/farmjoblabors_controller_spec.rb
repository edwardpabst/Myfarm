require 'spec_helper'

describe FarmjoblaborsController do

  def mock_farmjoblabor(stubs={})
    (@mock_farmjoblabor ||= mock_model(Farmjoblabor).as_null_object).tap do |farmjoblabor|
      farmjoblabor.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all farmjoblabors as @farmjoblabors" do
      Farmjoblabor.stub(:all) { [mock_farmjoblabor] }
      get :index
      assigns(:farmjoblabors).should eq([mock_farmjoblabor])
    end
  end

  describe "GET show" do
    it "assigns the requested farmjoblabor as @farmjoblabor" do
      Farmjoblabor.stub(:find).with("37") { mock_farmjoblabor }
      get :show, :id => "37"
      assigns(:farmjoblabor).should be(mock_farmjoblabor)
    end
  end

  describe "GET new" do
    it "assigns a new farmjoblabor as @farmjoblabor" do
      Farmjoblabor.stub(:new) { mock_farmjoblabor }
      get :new
      assigns(:farmjoblabor).should be(mock_farmjoblabor)
    end
  end

  describe "GET edit" do
    it "assigns the requested farmjoblabor as @farmjoblabor" do
      Farmjoblabor.stub(:find).with("37") { mock_farmjoblabor }
      get :edit, :id => "37"
      assigns(:farmjoblabor).should be(mock_farmjoblabor)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created farmjoblabor as @farmjoblabor" do
        Farmjoblabor.stub(:new).with({'these' => 'params'}) { mock_farmjoblabor(:save => true) }
        post :create, :farmjoblabor => {'these' => 'params'}
        assigns(:farmjoblabor).should be(mock_farmjoblabor)
      end

      it "redirects to the created farmjoblabor" do
        Farmjoblabor.stub(:new) { mock_farmjoblabor(:save => true) }
        post :create, :farmjoblabor => {}
        response.should redirect_to(farmjoblabor_url(mock_farmjoblabor))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved farmjoblabor as @farmjoblabor" do
        Farmjoblabor.stub(:new).with({'these' => 'params'}) { mock_farmjoblabor(:save => false) }
        post :create, :farmjoblabor => {'these' => 'params'}
        assigns(:farmjoblabor).should be(mock_farmjoblabor)
      end

      it "re-renders the 'new' template" do
        Farmjoblabor.stub(:new) { mock_farmjoblabor(:save => false) }
        post :create, :farmjoblabor => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested farmjoblabor" do
        Farmjoblabor.should_receive(:find).with("37") { mock_farmjoblabor }
        mock_farmjoblabor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :farmjoblabor => {'these' => 'params'}
      end

      it "assigns the requested farmjoblabor as @farmjoblabor" do
        Farmjoblabor.stub(:find) { mock_farmjoblabor(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:farmjoblabor).should be(mock_farmjoblabor)
      end

      it "redirects to the farmjoblabor" do
        Farmjoblabor.stub(:find) { mock_farmjoblabor(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(farmjoblabor_url(mock_farmjoblabor))
      end
    end

    describe "with invalid params" do
      it "assigns the farmjoblabor as @farmjoblabor" do
        Farmjoblabor.stub(:find) { mock_farmjoblabor(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:farmjoblabor).should be(mock_farmjoblabor)
      end

      it "re-renders the 'edit' template" do
        Farmjoblabor.stub(:find) { mock_farmjoblabor(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested farmjoblabor" do
      Farmjoblabor.should_receive(:find).with("37") { mock_farmjoblabor }
      mock_farmjoblabor.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the farmjoblabors list" do
      Farmjoblabor.stub(:find) { mock_farmjoblabor }
      delete :destroy, :id => "1"
      response.should redirect_to(farmjoblabors_url)
    end
  end

end
