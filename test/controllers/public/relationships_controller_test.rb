require "test_helper"

class Public::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get following" do
    get public_relationships_following_url
    assert_response :success
  end
end
