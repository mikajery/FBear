require 'test_helper'

class Three60sControllerTest < ActionController::TestCase
  setup do
    @three60 = three60s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:three60s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create three60" do
    assert_difference('Three60.count') do
      post :create, three60: {  }
    end

    assert_redirected_to three60_path(assigns(:three60))
  end

  test "should show three60" do
    get :show, id: @three60
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @three60
    assert_response :success
  end

  test "should update three60" do
    patch :update, id: @three60, three60: {  }
    assert_redirected_to three60_path(assigns(:three60))
  end

  test "should destroy three60" do
    assert_difference('Three60.count', -1) do
      delete :destroy, id: @three60
    end

    assert_redirected_to three60s_path
  end
end
