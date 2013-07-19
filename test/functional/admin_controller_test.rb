require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get p_add" do
    get :p_add
    assert_response :success
  end

  test "should get p_my_announces" do
    get :p_my_announces
    assert_response :success
  end

  test "should get p_text_stats" do
    get :p_text_stats
    assert_response :success
  end

  test "should get p_map_stats" do
    get :p_map_stats
    assert_response :success
  end

  test "should get p_calendar" do
    get :p_calendar
    assert_response :success
  end

  test "should get c_add" do
    get :c_add
    assert_response :success
  end

  test "should get c_delete" do
    get :c_delete
    assert_response :success
  end

  test "should get c_disable" do
    get :c_disable
    assert_response :success
  end

  test "should get p_edit" do
    get :p_edit
    assert_response :success
  end

end
