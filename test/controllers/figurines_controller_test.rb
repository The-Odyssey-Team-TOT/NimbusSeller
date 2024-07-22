require "test_helper"

class FigurinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get figurines_index_url
    assert_response :success
  end

  test "should get new" do
    get figurines_new_url
    assert_response :success
  end

  test "should get create" do
    get figurines_create_url
    assert_response :success
  end

  test "should get show" do
    get figurines_show_url
    assert_response :success
  end

  test "should get destroy" do
    get figurines_destroy_url
    assert_response :success
  end
end
