require "test_helper"

class Backoffice::EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_enrollments_index_url
    assert_response :success
  end
end
