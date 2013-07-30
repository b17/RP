require 'test_helper'

class NewsManagerControllerTest < ActionController::TestCase
  test "should get view_news" do
    get :view_news
    assert_response :success
  end

  test "should get add_news" do
    get :add_news
    assert_response :success
  end

  test "should get edit_news" do
    get :edit_news
    assert_response :success
  end

end
