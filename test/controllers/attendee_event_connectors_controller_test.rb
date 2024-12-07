require "test_helper"

class AttendeeEventConnectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get attendee_event_connectors_new_url
    assert_response :success
  end

  test "should get create" do
    get attendee_event_connectors_create_url
    assert_response :success
  end
end
