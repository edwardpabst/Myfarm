require 'spec_helper'

describe WeathersController do

  def mock_weather(stubs={})
    (@mock_weather ||= mock_model(Weather).as_null_object).tap do |weather|
      weather.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all weathers as @weathers" do
      Weather.stub(:all) { [mock_weather] }
      get :index
      assigns(:weathers).should eq([mock_weather])
    end
  end

  describe "GET show" do
    it "assigns the requested weather as @weather" do
      Weather.stub(:find).with("37") { mock_weather }
      get :show, :id => "37"
      assigns(:weather).should be(mock_weather)
    end
  end

  describe "GET new" do
    it "assigns a new weather as @weather" do
      Weather.stub(:new) { mock_weather }
      get :new
      assigns(:weather).should be(mock_weather)
    end
  end

  describe "GET edit" do
    it "assigns the requested weather as @weather" do
      Weather.stub(:find).with("37") { mock_weather }
      get :edit, :id => "37"
      assigns(:weather).should be(mock_weather)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created weather as @weather" do
        Weather.stub(:new).with({'these' => 'params'}) { mock_weather(:save => true) }
        post :create, :weather => {'these' => 'params'}
        assigns(:weather).should be(mock_weather)
      end

      it "redirects to the created weather" do
        Weather.stub(:new) { mock_weather(:save => true) }
        post :create, :weather => {}
        response.should redirect_to(weather_url(mock_weather))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved weather as @weather" do
        Weather.stub(:new).with({'these' => 'params'}) { mock_weather(:save => false) }
        post :create, :weather => {'these' => 'params'}
        assigns(:weather).should be(mock_weather)
      end

      it "re-renders the 'new' template" do
        Weather.stub(:new) { mock_weather(:save => false) }
        post :create, :weather => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested weather" do
        Weather.should_receive(:find).with("37") { mock_weather }
        mock_weather.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :weather => {'these' => 'params'}
      end

      it "assigns the requested weather as @weather" do
        Weather.stub(:find) { mock_weather(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:weather).should be(mock_weather)
      end

      it "redirects to the weather" do
        Weather.stub(:find) { mock_weather(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(weather_url(mock_weather))
      end
    end

    describe "with invalid params" do
      it "assigns the weather as @weather" do
        Weather.stub(:find) { mock_weather(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:weather).should be(mock_weather)
      end

      it "re-renders the 'edit' template" do
        Weather.stub(:find) { mock_weather(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested weather" do
      Weather.should_receive(:find).with("37") { mock_weather }
      mock_weather.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the weathers list" do
      Weather.stub(:find) { mock_weather }
      delete :destroy, :id => "1"
      response.should redirect_to(weathers_url)
    end
  end

end
