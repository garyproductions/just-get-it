require "test_helper"

class LoginUserTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com",
                              password: "password", admin: true)
    sign_in_as(@admin_user)
    @normal_user = User.create(username: "johnny", email: "johnny@example.com",
                              password: "password", admin: false)
  end

  test "should login as normal user, and go to that user's profile" do
    get login_path
    sign_in_as(@normal_user)
    follow_redirect!
    assert_response :success
    assert_match "johnny's Profile", response.body
  end

  test "should login as admin user, and go to that user's profile" do
    get login_path
    sign_in_as(@admin_user)
    follow_redirect!
    assert_response :success
    assert_match "(Admin) johndoe's Profile", response.body
  end

end
