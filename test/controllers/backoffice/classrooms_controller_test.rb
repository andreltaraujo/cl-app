require "test_helper"

class Backoffice::ClassroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_classrooms_index_url
    assert_response :success
  end
end
