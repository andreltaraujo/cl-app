require "test_helper"

class Backoffice::AdminProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_admin_profiles_index_url
    assert_response :success
  end
end
