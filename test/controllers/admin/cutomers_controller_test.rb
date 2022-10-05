require "test_helper"

class Admin::CutomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cutomers_index_url
    assert_response :success
  end
end
