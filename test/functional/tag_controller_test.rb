require 'test_helper'

class TagControllerTest < ActionController::TestCase
  test "should get p_all" do
    get :p_all
    assert_response :success
  end

  test "should get p_add" do
    get :p_add
    assert_response :success
  end

  test "should get c_disable" do
    get :c_disable
    assert_response :success
  end

  test "should get c_delete" do
    get :c_delete
    assert_response :success
  end

  test "should get p_edit" do
    get :p_edit
    assert_response :success
  end

  test "should get c_activate" do
    get :c_activate
    assert_response :success
  end

end
