require 'test_helper'

class HtmlControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
