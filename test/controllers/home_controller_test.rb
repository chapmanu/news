class HomeControllerTest < ActionDispatch::IntegrationTest
  test "expects to load home page" do
    get root_url
    assert_response :success
  end
end
