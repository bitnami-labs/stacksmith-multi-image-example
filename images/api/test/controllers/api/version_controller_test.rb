require 'test_helper'

class Api::VersionControllerTest < ActionDispatch::IntegrationTest
  test "should get version" do
    get api_version_url
    assert_response :success
  end

end
