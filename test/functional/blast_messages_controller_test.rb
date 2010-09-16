require 'test_helper'

class BlastMessagesControllerTest < ActionController::TestCase
  setup do
    @blast_message = Factory.build(:blast_message)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blast_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blast_message" do
    assert_difference('BlastMessage.count') do
      post :create, :blast_message => @blast_message.attributes
    end

    assert_redirected_to blast_message_path(assigns(:blast_message))
  end

  test "should show blast_message" do
    get :show, :id => @blast_message.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @blast_message.to_param
    assert_response :success
  end

  test "should update blast_message" do
    put :update, :id => @blast_message.to_param, :blast_message => @blast_message.attributes
    assert_redirected_to blast_message_path(assigns(:blast_message))
  end

  test "should destroy blast_message" do
    assert_difference('BlastMessage.count', -1) do
      delete :destroy, :id => @blast_message.to_param
    end

    assert_redirected_to blast_messages_path
  end
end
