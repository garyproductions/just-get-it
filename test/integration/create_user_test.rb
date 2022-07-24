require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest

  test "get new sign up form and create user, then go to user's profile page" do
    get signup_path
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path , params: { user: { username: "Tester", email: "test@test.com", password: "asdfasdf" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "tester's Profile", response.body
  end

end
