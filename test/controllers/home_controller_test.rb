require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get chartview" do
    get home_chartview_url
    assert_response :success
  end
end
