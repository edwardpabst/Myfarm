require 'spec_helper'

describe FarmexpensesController do

  def mock_farmexpense(stubs={})
    (@mock_farmexpense ||= mock_model(Farmexpense).as_null_object).tap do |farmexpense|
      farmexpense.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all farmexpenses as @farmexpenses" do
      Farmexpense.stub(:all) { [mock_farmexpense] }
      get :index
      assigns(:farmexpenses).should eq([mock_farmexpense])
    end
  end

  describe "GET show" do
    it "assigns the requested farmexpense as @farmexpense" do
      Farmexpense.stub(:find).with("37") { mock_farmexpense }
      get :show, :id => "37"
      assigns(:farmexpense).should be(mock_farmexpense)
    end
  end

  describe "GET new" do
    it "assigns a new farmexpense as @farmexpense" do
      Farmexpense.stub(:new) { mock_farmexpense }
      get :new
      assigns(:farmexpense).should be(mock_farmexpense)
    end
  end

  describe "GET edit" do
    it "assigns the requested farmexpense as @farmexpense" do
      Farmexpense.stub(:find).with("37") { mock_farmexpense }
      get :edit, :id => "37"
      assigns(:farmexpense).should be(mock_farmexpense)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created farmexpense as @farmexpense" do
        Farmexpense.stub(:new).with({'these' => 'params'}) { mock_farmexpense(:save => true) }
        post :create, :farmexpense => {'these' => 'params'}
        assigns(:farmexpense).should be(mock_farmexpense)
      end

      it "redirects to the created farmexpense" do
        Farmexpense.stub(:new) { mock_farmexpense(:save => true) }
        post :create, :farmexpense => {}
        response.should redirect_to(farmexpense_url(mock_farmexpense))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved farmexpense as @farmexpense" do
        Farmexpense.stub(:new).with({'these' => 'params'}) { mock_farmexpense(:save => false) }
        post :create, :farmexpense => {'these' => 'params'}
        assigns(:farmexpense).should be(mock_farmexpense)
      end

      it "re-renders the 'new' template" do
        Farmexpense.stub(:new) { mock_farmexpense(:save => false) }
        post :create, :farmexpense => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested farmexpense" do
        Farmexpense.should_receive(:find).with("37") { mock_farmexpense }
        mock_farmexpense.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :farmexpense => {'these' => 'params'}
      end

      it "assigns the requested farmexpense as @farmexpense" do
        Farmexpense.stub(:find) { mock_farmexpense(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:farmexpense).should be(mock_farmexpense)
      end

      it "redirects to the farmexpense" do
        Farmexpense.stub(:find) { mock_farmexpense(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(farmexpense_url(mock_farmexpense))
      end
    end

    describe "with invalid params" do
      it "assigns the farmexpense as @farmexpense" do
        Farmexpense.stub(:find) { mock_farmexpense(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:farmexpense).should be(mock_farmexpense)
      end

      it "re-renders the 'edit' template" do
        Farmexpense.stub(:find) { mock_farmexpense(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested farmexpense" do
      Farmexpense.should_receive(:find).with("37") { mock_farmexpense }
      mock_farmexpense.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the farmexpenses list" do
      Farmexpense.stub(:find) { mock_farmexpense }
      delete :destroy, :id => "1"
      response.should redirect_to(farmexpenses_url)
    end
  end

end
