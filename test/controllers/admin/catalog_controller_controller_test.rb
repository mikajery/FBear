require 'test_helper'

class Admin::CatalogControllerControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get item" do
    get :item
    assert_response :success
  end

end
