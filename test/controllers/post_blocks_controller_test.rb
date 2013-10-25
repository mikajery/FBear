require 'test_helper'

class PostBlocksControllerTest < ActionController::TestCase
  setup do
    @post_block = post_blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_block" do
    assert_difference('PostBlock.count') do
      post :create, post_block: {  }
    end

    assert_redirected_to post_block_path(assigns(:post_block))
  end

  test "should show post_block" do
    get :show, id: @post_block
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_block
    assert_response :success
  end

  test "should update post_block" do
    patch :update, id: @post_block, post_block: {  }
    assert_redirected_to post_block_path(assigns(:post_block))
  end

  test "should destroy post_block" do
    assert_difference('PostBlock.count', -1) do
      delete :destroy, id: @post_block
    end

    assert_redirected_to post_blocks_path
  end
end
