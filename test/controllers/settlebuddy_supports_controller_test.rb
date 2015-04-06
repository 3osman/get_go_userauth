require 'test_helper'

class SettlebuddySupportsControllerTest < ActionController::TestCase
  setup do
    @settlebuddy_support = settlebuddy_supports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settlebuddy_supports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create settlebuddy_support" do
    assert_difference('SettlebuddySupport.count') do
      post :create, settlebuddy_support: { bank: @settlebuddy_support.bank, caf: @settlebuddy_support.caf, housing: @settlebuddy_support.housing, public_transport: @settlebuddy_support.public_transport, telecommunication: @settlebuddy_support.telecommunication, user_id: @settlebuddy_support.user_id, visa: @settlebuddy_support.visa }
    end

    assert_redirected_to settlebuddy_support_path(assigns(:settlebuddy_support))
  end

  test "should show settlebuddy_support" do
    get :show, id: @settlebuddy_support
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @settlebuddy_support
    assert_response :success
  end

  test "should update settlebuddy_support" do
    patch :update, id: @settlebuddy_support, settlebuddy_support: { bank: @settlebuddy_support.bank, caf: @settlebuddy_support.caf, housing: @settlebuddy_support.housing, public_transport: @settlebuddy_support.public_transport, telecommunication: @settlebuddy_support.telecommunication, user_id: @settlebuddy_support.user_id, visa: @settlebuddy_support.visa }
    assert_redirected_to settlebuddy_support_path(assigns(:settlebuddy_support))
  end

  test "should destroy settlebuddy_support" do
    assert_difference('SettlebuddySupport.count', -1) do
      delete :destroy, id: @settlebuddy_support
    end

    assert_redirected_to settlebuddy_supports_path
  end
end
