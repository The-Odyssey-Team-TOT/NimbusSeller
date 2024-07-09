require "test_helper"

class BroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brooms_index_url
    assert_response :success
  end

  test "should get new" do
    get brooms_new_url
    assert_response :success
  end

  test "should get show" do
    get brooms_show_url
    assert_response :success
  end

  test "should get create" do
    get brooms_create_url
    assert_response :success
  end
end
