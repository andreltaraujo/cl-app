require "test_helper"

class Backoffice::ProgramsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_programs_index_url
    assert_response :success
  end
end
