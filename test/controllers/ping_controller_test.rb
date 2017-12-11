class PingControllerTest < ActionDispatch::IntegrationTest
  test "Ping responds with pong in json" do
    get api_v1_ping_url
    assert_response :success
    assert_equal 'pong', JSON.parse(response.body)['data']
  end
end
