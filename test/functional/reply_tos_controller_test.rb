require 'test_helper'

class ReplyTosControllerTest < ActionController::TestCase
  setup do
    @reply_to = Factory.build(:reply_to)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reply_tos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reply_to" do
    assert_difference('ReplyTo.count') do
      post :create, :reply_to => @reply_to.attributes
    end

    assert_redirected_to reply_to_path(assigns(:reply_to))
  end

  test "should show reply_to" do
    get :show, :id => @reply_to.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reply_to.to_param
    assert_response :success
  end

  test "should update reply_to" do
    put :update, :id => @reply_to.to_param, :reply_to => @reply_to.attributes
    assert_redirected_to reply_to_path(assigns(:reply_to))
  end

  test "should destroy reply_to" do
    assert_difference('ReplyTo.count', -1) do
      delete :destroy, :id => @reply_to.to_param
    end

    assert_redirected_to reply_tos_path
  end
end
