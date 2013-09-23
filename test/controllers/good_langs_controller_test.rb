require 'test_helper'

class GoodLangsControllerTest < ActionController::TestCase
  setup do
    @good_lang = good_langs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:good_langs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create good_lang" do
    assert_difference('GoodLang.count') do
      post :create, good_lang: {  }
    end

    assert_redirected_to good_lang_path(assigns(:good_lang))
  end

  test "should show good_lang" do
    get :show, id: @good_lang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @good_lang
    assert_response :success
  end

  test "should update good_lang" do
    patch :update, id: @good_lang, good_lang: {  }
    assert_redirected_to good_lang_path(assigns(:good_lang))
  end

  test "should destroy good_lang" do
    assert_difference('GoodLang.count', -1) do
      delete :destroy, id: @good_lang
    end

    assert_redirected_to good_langs_path
  end
end
