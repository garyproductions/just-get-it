require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "johnny", email: "johnny@example.com",
                        password: "password", admin: false)
    @category = Category.new(name: "Sports")
    @category2 = Category.new(name: "Nonsense")
    @article = Article.create(title: "Test Article", description: "This is the description of the the test article!", user_id: @user.id)
  end

  test "articles should be able to have a category" do
    @article.categories = [@category]
    assert @article.categories != []
  end

  test "articles should be able to have multiple categories" do
    @article.categories = [@category, @category2]
    assert @article.categories == [@category, @category2]
  end

end
