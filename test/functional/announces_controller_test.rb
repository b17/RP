require 'test_helper'

class AnnouncesControllerTest < ActionController::TestCase
  setup do
    @announce = announces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:announces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create announce" do
    assert_difference('Announce.count') do
      post :create, announce: { date: @announce.date, desc: @announce.desc, lg: @announce.lg, lt: @announce.lt, main_img_url: @announce.main_img_url, title: @announce.title }
    end

    assert_redirected_to announce_path(assigns(:announce))
  end

  test "should show announce" do
    get :show, id: @announce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @announce
    assert_response :success
  end

  test "should update announce" do
    put :update, id: @announce, announce: { date: @announce.date, desc: @announce.desc, lg: @announce.lg, lt: @announce.lt, main_img_url: @announce.main_img_url, title: @announce.title }
    assert_redirected_to announce_path(assigns(:announce))
  end

  test "should destroy announce" do
    assert_difference('Announce.count', -1) do
      delete :destroy, id: @announce
    end

    assert_redirected_to announces_path
  end
end
