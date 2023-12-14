require "test_helper"

class DisplayControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get display_new_url
    assert_response :success
  end
end
