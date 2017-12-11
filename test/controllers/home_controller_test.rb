class HomesControllerTest < ActionDispatch::IntegrationTest
  test "expects to load home page" do
    get root_url
    assert_response :success
  end
end
