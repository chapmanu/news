require 'rails_helper'

# Rubocop flags this test as a block that's too long
# Ignore that error in this file
# rubocop:disable Metrics/BlockLength
RSpec.describe Admin::UsersController, type: :controller do
  render_views
  fixtures :users

  it 'redirects to login page if not signed in' do
    # Arrange
    login_as(nil)

    # Assert
    expect(get(:index)).to redirect_to(new_user_session_path)
  end

  it 'shows permission denied if not an admin' do
    # Arrange
    test_user = users(:non_admin)
    login_as(test_user)

    # Act
    get :index

    # Assert
    expect(response).to render_template "permission_denied"
    expect(response.body).to have_content "You must have admin access"
  end

  describe 'Admin user' do
    it 'can see admin dashboard with users table' do
      # Arrange
      test_admin = users(:admin)
      login_as(test_admin)

      # Act
      get :index

      # Assert
      expect(response).to render_template "users/index"
      expect(response.body).to have_content "Billy Goat"
      expect(response.body).to have_content "Newsroom Admin"
    end

    it 'can visit user edit page' do
      # Arrange
      test_admin = users(:admin)
      login_as(test_admin)
      charles = User.find_by(username: "cchapman")

      # Act
      get :edit, params: { id: charles }

      # Assert
      expect(response).to render_template "users/edit"
      expect(response.body).to have_content "cchapman@chapman.edu"
    end

    it 'can see user details' do
      # Arrange
      test_admin = users(:admin)
      login_as(test_admin)
      charles = User.find_by(username: "cchapman")

      # Act
      get :show, params: { id: charles }

      # Assert
      expect(response).to render_template "users/show"
      expect(response.body).to have_content "cchapman@chapman.edu"
    end
  end
end
