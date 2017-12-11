class HomesControllerTest < ActionDispatch::IntegrationTest
  test "expect home page" do
    get root_url
    assert_response :success
  end
end
