require 'test_helper'

class TempletsControllerTest < ActionController::TestCase
  setup do
    @templet = templets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:templets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create templet" do
    assert_difference('Templet.count') do
      post :create, templet: {  }
    end

    assert_redirected_to templet_path(assigns(:templet))
  end

  test "should show templet" do
    get :show, id: @templet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @templet
    assert_response :success
  end

  test "should update templet" do
    patch :update, id: @templet, templet: {  }
    assert_redirected_to templet_path(assigns(:templet))
  end

  test "should destroy templet" do
    assert_difference('Templet.count', -1) do
      delete :destroy, id: @templet
    end

    assert_redirected_to templets_path
  end
end
