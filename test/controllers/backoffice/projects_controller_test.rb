require "test_helper"

class Backoffice::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_projects_index_url
    assert_response :success
  end
end
