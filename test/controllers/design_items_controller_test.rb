require 'test_helper'

class DesignItemsControllerTest < ActionController::TestCase
  setup do
    @design_item = design_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:design_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create design_item" do
    assert_difference('DesignItem.count') do
      post :create, design_item: {  }
    end

    assert_redirected_to design_item_path(assigns(:design_item))
  end

  test "should show design_item" do
    get :show, id: @design_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @design_item
    assert_response :success
  end

  test "should update design_item" do
    patch :update, id: @design_item, design_item: {  }
    assert_redirected_to design_item_path(assigns(:design_item))
  end

  test "should destroy design_item" do
    assert_difference('DesignItem.count', -1) do
      delete :destroy, id: @design_item
    end

    assert_redirected_to design_items_path
  end
end
