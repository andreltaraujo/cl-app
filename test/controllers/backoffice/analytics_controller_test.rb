require "test_helper"

class Backoffice::AnalyticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_analytics_index_url
    assert_response :success
  end
end
