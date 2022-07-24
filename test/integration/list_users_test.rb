require "test_helper"

class ListUsersTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "johnny", email: "johndoe@example.com",
                              password: "password", admin: false)
    @user2 = User.create(username: "johnny2", email: "johndoe2@example.com",
                              password: "password", admin: false)
  end

  test "should show users listing" do
    get '/users'
    assert_select "a[href=?]", user_path(@user), text: @user.username
    assert_select "a[href=?]", user_path(@user2), text: @user2.username
  end
end
