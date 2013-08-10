require 'test_helper'

class Admin::LanguagesControllerTest < ActionController::TestCase
  setup do
    @admin_language = admin_languages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_language" do
    assert_difference('Admin::Language.count') do
      post :create, admin_language: { code: @admin_language.code, name: @admin_language.name }
    end

    assert_redirected_to admin_language_path(assigns(:admin_language))
  end

  test "should show admin_language" do
    get :show, id: @admin_language
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_language
    assert_response :success
  end

  test "should update admin_language" do
    patch :update, id: @admin_language, admin_language: { code: @admin_language.code, name: @admin_language.name }
    assert_redirected_to admin_language_path(assigns(:admin_language))
  end

  test "should destroy admin_language" do
    assert_difference('Admin::Language.count', -1) do
      delete :destroy, id: @admin_language
    end

    assert_redirected_to admin_languages_path
  end
end
