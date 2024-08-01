require "test_helper"

class Backoffice::EducProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_educ_profiles_index_url
    assert_response :success
  end
end
