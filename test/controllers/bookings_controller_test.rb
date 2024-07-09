require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bookings_create_url
    assert_response :success
  end

  test "should get owner_bookings" do
    get bookings_owner_bookings_url
    assert_response :success
  end

  test "should get renter_bookings" do
    get bookings_renter_bookings_url
    assert_response :success
  end
end
