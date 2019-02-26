require 'test_helper'

class AssignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assign = assigns(:one)
  end

  test "should get index" do
    get assigns_url
    assert_response :success
  end

  test "should get new" do
    get new_assign_url
    assert_response :success
  end

  test "should create assign" do
    assert_difference('Assign.count') do
      post assigns_url, params: { assign: { admin_confirm: @assign.admin_confirm, user_confirm: @assign.user_confirm, user_id: @assign.user_id, video_id: @assign.video_id } }
    end

    assert_redirected_to assign_url(Assign.last)
  end

  test "should show assign" do
    get assign_url(@assign)
    assert_response :success
  end

  test "should get edit" do
    get edit_assign_url(@assign)
    assert_response :success
  end

  test "should update assign" do
    patch assign_url(@assign), params: { assign: { admin_confirm: @assign.admin_confirm, user_confirm: @assign.user_confirm, user_id: @assign.user_id, video_id: @assign.video_id } }
    assert_redirected_to assign_url(@assign)
  end

  test "should destroy assign" do
    assert_difference('Assign.count', -1) do
      delete assign_url(@assign)
    end

    assert_redirected_to assigns_url
  end
end
