require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  it 'renders the homepage' do
    # Act
    get :index

    # Assert
    expect(response).to render_template("index")
    expect(response.body).to have_content("Newsroom")
  end
end
