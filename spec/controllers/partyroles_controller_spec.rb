require 'spec_helper'

describe PartyrolesController do

  def mock_partyrole(stubs={})
    (@mock_partyrole ||= mock_model(Partyrole).as_null_object).tap do |partyrole|
      partyrole.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all partyroles as @partyroles" do
      Partyrole.stub(:all) { [mock_partyrole] }
      get :index
      assigns(:partyroles).should eq([mock_partyrole])
    end
  end

  describe "GET show" do
    it "assigns the requested partyrole as @partyrole" do
      Partyrole.stub(:find).with("37") { mock_partyrole }
      get :show, :id => "37"
      assigns(:partyrole).should be(mock_partyrole)
    end
  end

  describe "GET new" do
    it "assigns a new partyrole as @partyrole" do
      Partyrole.stub(:new) { mock_partyrole }
      get :new
      assigns(:partyrole).should be(mock_partyrole)
    end
  end

  describe "GET edit" do
    it "assigns the requested partyrole as @partyrole" do
      Partyrole.stub(:find).with("37") { mock_partyrole }
      get :edit, :id => "37"
      assigns(:partyrole).should be(mock_partyrole)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created partyrole as @partyrole" do
        Partyrole.stub(:new).with({'these' => 'params'}) { mock_partyrole(:save => true) }
        post :create, :partyrole => {'these' => 'params'}
        assigns(:partyrole).should be(mock_partyrole)
      end

      it "redirects to the created partyrole" do
        Partyrole.stub(:new) { mock_partyrole(:save => true) }
        post :create, :partyrole => {}
        response.should redirect_to(partyrole_url(mock_partyrole))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved partyrole as @partyrole" do
        Partyrole.stub(:new).with({'these' => 'params'}) { mock_partyrole(:save => false) }
        post :create, :partyrole => {'these' => 'params'}
        assigns(:partyrole).should be(mock_partyrole)
      end

      it "re-renders the 'new' template" do
        Partyrole.stub(:new) { mock_partyrole(:save => false) }
        post :create, :partyrole => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested partyrole" do
        Partyrole.should_receive(:find).with("37") { mock_partyrole }
        mock_partyrole.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :partyrole => {'these' => 'params'}
      end

      it "assigns the requested partyrole as @partyrole" do
        Partyrole.stub(:find) { mock_partyrole(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:partyrole).should be(mock_partyrole)
      end

      it "redirects to the partyrole" do
        Partyrole.stub(:find) { mock_partyrole(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(partyrole_url(mock_partyrole))
      end
    end

    describe "with invalid params" do
      it "assigns the partyrole as @partyrole" do
        Partyrole.stub(:find) { mock_partyrole(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:partyrole).should be(mock_partyrole)
      end

      it "re-renders the 'edit' template" do
        Partyrole.stub(:find) { mock_partyrole(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested partyrole" do
      Partyrole.should_receive(:find).with("37") { mock_partyrole }
      mock_partyrole.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the partyroles list" do
      Partyrole.stub(:find) { mock_partyrole }
      delete :destroy, :id => "1"
      response.should redirect_to(partyroles_url)
    end
  end

end
