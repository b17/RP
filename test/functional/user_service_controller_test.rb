require 'test_helper'

class UserServiceControllerTest < ActionController::TestCase
  test "should get p_register" do
    get :p_register
    assert_response :success
  end

  test "should get p_reset" do
    get :p_reset
    assert_response :success
  end

  test "should get p_login" do
    get :p_login
    assert_response :success
  end

  test "should get c_register" do
    get :c_register
    assert_response :success
  end

  test "should get c_reset" do
    get :c_reset
    assert_response :success
  end

end
