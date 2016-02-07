require "rails_helper"

RSpec.describe MixesController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the mixes into @mixes" do
      mix1, mix2 = Mix.create!, Mix.create!
      get :index

      expect(assigns(:mixes)).to match_array([mix1, mix2])
    end
  end
end
