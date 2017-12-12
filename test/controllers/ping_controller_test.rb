require 'test_helper'

class PingControllerTest < ActionDispatch::IntegrationTest
  test "expects pong json response" do
    get api_v1_ping_path
    assert_response :success
    assert_equal 'pong', JSON.parse(response.body)['data']
  end
end
