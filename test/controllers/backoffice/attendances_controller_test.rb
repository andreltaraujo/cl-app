require "test_helper"

class Backoffice::AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_attendances_index_url
    assert_response :success
  end
end
