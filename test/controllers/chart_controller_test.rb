require "test_helper"

class ChartControllerTest < ActionDispatch::IntegrationTest
  test "should get chartview" do
    get chart_chartview_url
    assert_response :success
  end
end
