require 'spec_helper'

describe PartytypesController do

  def mock_partytype(stubs={})
    (@mock_partytype ||= mock_model(Partytype).as_null_object).tap do |partytype|
      partytype.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all partytypes as @partytypes" do
      Partytype.stub(:all) { [mock_partytype] }
      get :index
      assigns(:partytypes).should eq([mock_partytype])
    end
  end

  describe "GET show" do
    it "assigns the requested partytype as @partytype" do
      Partytype.stub(:find).with("37") { mock_partytype }
      get :show, :id => "37"
      assigns(:partytype).should be(mock_partytype)
    end
  end

  describe "GET new" do
    it "assigns a new partytype as @partytype" do
      Partytype.stub(:new) { mock_partytype }
      get :new
      assigns(:partytype).should be(mock_partytype)
    end
  end

  describe "GET edit" do
    it "assigns the requested partytype as @partytype" do
      Partytype.stub(:find).with("37") { mock_partytype }
      get :edit, :id => "37"
      assigns(:partytype).should be(mock_partytype)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created partytype as @partytype" do
        Partytype.stub(:new).with({'these' => 'params'}) { mock_partytype(:save => true) }
        post :create, :partytype => {'these' => 'params'}
        assigns(:partytype).should be(mock_partytype)
      end

      it "redirects to the created partytype" do
        Partytype.stub(:new) { mock_partytype(:save => true) }
        post :create, :partytype => {}
        response.should redirect_to(partytype_url(mock_partytype))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved partytype as @partytype" do
        Partytype.stub(:new).with({'these' => 'params'}) { mock_partytype(:save => false) }
        post :create, :partytype => {'these' => 'params'}
        assigns(:partytype).should be(mock_partytype)
      end

      it "re-renders the 'new' template" do
        Partytype.stub(:new) { mock_partytype(:save => false) }
        post :create, :partytype => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested partytype" do
        Partytype.should_receive(:find).with("37") { mock_partytype }
        mock_partytype.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :partytype => {'these' => 'params'}
      end

      it "assigns the requested partytype as @partytype" do
        Partytype.stub(:find) { mock_partytype(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:partytype).should be(mock_partytype)
      end

      it "redirects to the partytype" do
        Partytype.stub(:find) { mock_partytype(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(partytype_url(mock_partytype))
      end
    end

    describe "with invalid params" do
      it "assigns the partytype as @partytype" do
        Partytype.stub(:find) { mock_partytype(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:partytype).should be(mock_partytype)
      end

      it "re-renders the 'edit' template" do
        Partytype.stub(:find) { mock_partytype(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested partytype" do
      Partytype.should_receive(:find).with("37") { mock_partytype }
      mock_partytype.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the partytypes list" do
      Partytype.stub(:find) { mock_partytype }
      delete :destroy, :id => "1"
      response.should redirect_to(partytypes_url)
    end
  end

end
