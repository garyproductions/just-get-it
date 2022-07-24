require "test_helper"

class ListArticlesTest < ActionDispatch::IntegrationTest
  def setup
    @article_user = User.create(username: "johnny", email: "johndoe@example.com",
                              password: "password", admin: false)
    @article = Article.create(title: "Sports", description: "This is a sports article", user_id: @article_user.id)
    @article2 = Article.create(title: "Travel", description: "This is a travel article", user_id: @article_user.id)
  end

  test "should show articles listing" do
    get '/articles'
    assert_select "a[href=?]", article_path(@article), text: @article.title
    assert_select "a[href=?]", article_path(@article2), text: @article2.title
  end
end
