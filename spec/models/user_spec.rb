require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  it 'fixtures are defined and valid' do
    # Arrange
    test_admin = users(:admin)
    test_non_admin = users(:non_admin)
    test_charles = users(:charles)

    # Assert
    expect(User.all).to include test_admin
    expect(User.all).to include test_non_admin
    expect(User.all).to include test_charles
    expect(test_admin).to be_valid
    expect(test_non_admin).to be_valid
    expect(test_charles).to be_valid
  end

  it 'must have an email address' do
    test_user = users(:charles)
    test_user.email = nil

    expect(test_user).to_not be_valid
  end

  it 'must have a first name' do
    test_user = users(:charles)
    test_user.first_name = nil

    expect(test_user).to_not be_valid
  end

  it 'must have a last name' do
    test_user = users(:charles)
    test_user.last_name = nil

    expect(test_user).to_not be_valid
  end
end
