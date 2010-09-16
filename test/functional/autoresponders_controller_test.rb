require 'test_helper'

class AutorespondersControllerTest < ActionController::TestCase
  setup do
    @user.save
    @list = @user.lists.create(Factory.attributes_for(:list))
    @autoresponder = Factory.create(:autoresponder, :list => @list)
    sign_in @user
  end
  
  teardown do
    @list.delete
    @user.delete
  end

  test "should get index" do
    get :index, :list_id => @list.id
    assert_response :success
    assert_not_nil assigns(:autoresponders)
  end

  test "should get new" do
    get :new, :list_id => @list.id
    assert_response :success
  end

  test "should create autoresponder" do
    assert_difference('Autoresponder.count') do
      post :create, :list_id => @list.id, :autoresponder => @autoresponder.attributes
    end

    assert_redirected_to autoresponder_path(assigns(:autoresponder))
  end

  test "should show autoresponder" do
    get :show, :list_id => @list.id, :id => @autoresponder.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :list_id => @list.id, :id => @autoresponder.to_param
    assert_response :success
  end

  test "should update autoresponder" do
    put :update, :list_id => @list.id, :id => @autoresponder.to_param, :autoresponder => @autoresponder.attributes
    assert_redirected_to autoresponder_path(assigns(:autoresponder))
  end

  test "should destroy autoresponder" do
    assert_difference('Autoresponder.count', -1) do
      delete :destroy, :list_id => @list.id, :id => @autoresponder.to_param
    end

    assert_redirected_to autoresponders_path
  end
end
