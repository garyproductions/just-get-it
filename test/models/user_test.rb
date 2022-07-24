require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @normal_user = User.create(username: "johnny", email: "johnny@example.com",
                              password: "password", admin: false)
  end

  test "user should be valid" do
    assert @normal_user.valid?
  end

  test "username should be present" do
    @normal_user.username = ""
    assert_not @normal_user.valid?
  end

  test "username should not be too long" do
    @normal_user.username = "a" * 26
    assert_not @normal_user.valid?
  end

  test "username should not be too short" do
    @normal_user.username = "aa"
    assert_not @normal_user.valid?
  end

  test "username should be unique" do
    @normal_user.save
    @normal_user2 = User.new(username: "johnny", email: "johnny@derp.com",
                            password: "password", admin: false)
    assert_not @normal_user2.valid?
  end

  test "email should be present" do
    @normal_user.email = ""
    assert_not @normal_user.valid?
  end

  test "email should not be too long" do
    @normal_user.email = "a" * 106
    assert_not @normal_user.valid?
  end

  test "email should not be too short" do
    @normal_user.email = "a@1.4"
    assert_not @normal_user.valid?
  end

  test "email should be unique" do
    @normal_user.save
    @normal_user2 = User.new(username: "johnnyd", email: "johnny@example.com",
                            password: "password", admin: false)
    assert_not @normal_user2.valid?
  end















end
