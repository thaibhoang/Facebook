require "test_helper"

class MyRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get my_registrations_create_url
    assert_response :success
  end
end
