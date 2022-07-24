require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @user = User.create(username: "johnny", email: "johnny@example.com",
                              password: "password", admin: false)
    @article = Article.create(title: "Test Article", description: "This is the description of the the test article!", user_id: @user.id)
  end

  test "article should be valid" do
    assert @article.valid?
  end

  test "article title should be present" do
    @article.title = ""
    assert_not @article.valid?
  end

  test "article title should not be too long" do
    @article.title = "a" * 101
    assert_not @article.valid?
  end

  test "article title should not be too short" do
    @article.title = "aa"
    assert_not @article.valid?
  end

  test "article description should not be too long" do
    @article.description = "a" * 5001
    assert_not @article.valid?
  end

  test "article description should not be too short" do
    @article.description = "a" * 9
    assert_not @article.valid?
  end















end
