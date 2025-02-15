require "test_helper"

class ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shops_index_url
    assert_response :success
  end

  test "should get new" do
    get shops_new_url
    assert_response :success
  end

  test "should get create" do
    get shops_create_url
    assert_response :success
  end

  test "should get show" do
    get shops_show_url
    assert_response :success
  end

  test "should get destroy" do
    get shops_destroy_url
    assert_response :success
  end
end
