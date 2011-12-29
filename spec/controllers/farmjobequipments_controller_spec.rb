require 'spec_helper'

describe FarmjobequipmentsController do

  def mock_farmjobequipment(stubs={})
    (@mock_farmjobequipment ||= mock_model(Farmjobequipment).as_null_object).tap do |farmjobequipment|
      farmjobequipment.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all farmjobequipments as @farmjobequipments" do
      Farmjobequipment.stub(:all) { [mock_farmjobequipment] }
      get :index
      assigns(:farmjobequipments).should eq([mock_farmjobequipment])
    end
  end

  describe "GET show" do
    it "assigns the requested farmjobequipment as @farmjobequipment" do
      Farmjobequipment.stub(:find).with("37") { mock_farmjobequipment }
      get :show, :id => "37"
      assigns(:farmjobequipment).should be(mock_farmjobequipment)
    end
  end

  describe "GET new" do
    it "assigns a new farmjobequipment as @farmjobequipment" do
      Farmjobequipment.stub(:new) { mock_farmjobequipment }
      get :new
      assigns(:farmjobequipment).should be(mock_farmjobequipment)
    end
  end

  describe "GET edit" do
    it "assigns the requested farmjobequipment as @farmjobequipment" do
      Farmjobequipment.stub(:find).with("37") { mock_farmjobequipment }
      get :edit, :id => "37"
      assigns(:farmjobequipment).should be(mock_farmjobequipment)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created farmjobequipment as @farmjobequipment" do
        Farmjobequipment.stub(:new).with({'these' => 'params'}) { mock_farmjobequipment(:save => true) }
        post :create, :farmjobequipment => {'these' => 'params'}
        assigns(:farmjobequipment).should be(mock_farmjobequipment)
      end

      it "redirects to the created farmjobequipment" do
        Farmjobequipment.stub(:new) { mock_farmjobequipment(:save => true) }
        post :create, :farmjobequipment => {}
        response.should redirect_to(farmjobequipment_url(mock_farmjobequipment))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved farmjobequipment as @farmjobequipment" do
        Farmjobequipment.stub(:new).with({'these' => 'params'}) { mock_farmjobequipment(:save => false) }
        post :create, :farmjobequipment => {'these' => 'params'}
        assigns(:farmjobequipment).should be(mock_farmjobequipment)
      end

      it "re-renders the 'new' template" do
        Farmjobequipment.stub(:new) { mock_farmjobequipment(:save => false) }
        post :create, :farmjobequipment => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested farmjobequipment" do
        Farmjobequipment.should_receive(:find).with("37") { mock_farmjobequipment }
        mock_farmjobequipment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :farmjobequipment => {'these' => 'params'}
      end

      it "assigns the requested farmjobequipment as @farmjobequipment" do
        Farmjobequipment.stub(:find) { mock_farmjobequipment(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:farmjobequipment).should be(mock_farmjobequipment)
      end

      it "redirects to the farmjobequipment" do
        Farmjobequipment.stub(:find) { mock_farmjobequipment(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(farmjobequipment_url(mock_farmjobequipment))
      end
    end

    describe "with invalid params" do
      it "assigns the farmjobequipment as @farmjobequipment" do
        Farmjobequipment.stub(:find) { mock_farmjobequipment(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:farmjobequipment).should be(mock_farmjobequipment)
      end

      it "re-renders the 'edit' template" do
        Farmjobequipment.stub(:find) { mock_farmjobequipment(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested farmjobequipment" do
      Farmjobequipment.should_receive(:find).with("37") { mock_farmjobequipment }
      mock_farmjobequipment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the farmjobequipments list" do
      Farmjobequipment.stub(:find) { mock_farmjobequipment }
      delete :destroy, :id => "1"
      response.should redirect_to(farmjobequipments_url)
    end
  end

end
