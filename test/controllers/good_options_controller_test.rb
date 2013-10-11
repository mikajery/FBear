require 'test_helper'

class GoodOptionsControllerTest < ActionController::TestCase
  setup do
    @good_option = good_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:good_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create good_option" do
    assert_difference('GoodOption.count') do
      post :create, good_option: {  }
    end

    assert_redirected_to good_option_path(assigns(:good_option))
  end

  test "should show good_option" do
    get :show, id: @good_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @good_option
    assert_response :success
  end

  test "should update good_option" do
    patch :update, id: @good_option, good_option: {  }
    assert_redirected_to good_option_path(assigns(:good_option))
  end

  test "should destroy good_option" do
    assert_difference('GoodOption.count', -1) do
      delete :destroy, id: @good_option
    end

    assert_redirected_to good_options_path
  end
end
