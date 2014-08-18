require 'test_helper'

class DocUsersControllerTest < ActionController::TestCase
  setup do
    @doc_user = doc_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doc_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doc_user" do
    assert_difference('DocUser.count') do
      post :create, doc_user: { email: @doc_user.email, name: @doc_user.name }
    end

    assert_redirected_to doc_user_path(assigns(:doc_user))
  end

  test "should show doc_user" do
    get :show, id: @doc_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doc_user
    assert_response :success
  end

  test "should update doc_user" do
    put :update, id: @doc_user, doc_user: { email: @doc_user.email, name: @doc_user.name }
    assert_redirected_to doc_user_path(assigns(:doc_user))
  end

  test "should destroy doc_user" do
    assert_difference('DocUser.count', -1) do
      delete :destroy, id: @doc_user
    end

    assert_redirected_to doc_users_path
  end
end
