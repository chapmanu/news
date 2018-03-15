require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  describe "GET index" do
    it "renders the home page" do
      get :index
      expect(response).to be_success
      expect(response.body).to have_content("Newsroom")
    end
  end
end
