require "test_helper"

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get chartview" do
    get charts_chartview_url
    assert_response :success
  end
end
