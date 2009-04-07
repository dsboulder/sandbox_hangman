require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create round" do
    assert_difference('Round.count') do
      post :create, :round => { }
    end

    assert_redirected_to round_path(assigns(:round))
  end

  test "should show round" do
    get :show, :id => rounds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rounds(:one).to_param
    assert_response :success
  end

  test "should update round" do
    put :update, :id => rounds(:one).to_param, :round => { }
    assert_redirected_to round_path(assigns(:round))
  end

  test "should destroy round" do
    assert_difference('Round.count', -1) do
      delete :destroy, :id => rounds(:one).to_param
    end

    assert_redirected_to rounds_path
  end
end
