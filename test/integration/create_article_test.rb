require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  setup do
    @regular_user = User.create(username: "johnny", email: "johndoe@example.com",
                              password: "password", admin: false)
    sign_in_as(@regular_user)
  end

  test "get new article form and creating article" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "Sports", description: "This article is about sports!" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Article was created successfully", response.body
  end


  test "get new article form and reject invalid article submission" do
    get "/articles/new"
    assert_response :success
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { title: "", description: "" } }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'

  end
end
