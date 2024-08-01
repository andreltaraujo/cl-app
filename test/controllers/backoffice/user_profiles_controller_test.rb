require "test_helper"

class Backoffice::UserProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_user_profiles_index_url
    assert_response :success
  end
end
