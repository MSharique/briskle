require 'test_helper'

class FriendControllerTest < ActionDispatch::IntegrationTest
  test "should get add_friend" do
    get friend_add_friend_url
    assert_response :success
  end

end
