require 'test_helper'

class RootControllerTest < ActionController::TestCase
  test "should get feed" do
    get :feed
    assert_response :success
  end

  test "should get tag" do
    get :tag
    assert_response :success
  end

end
