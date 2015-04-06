require 'test_helper'

class DocumentCommentsControllerTest < ActionController::TestCase
  setup do
    @document_comment = document_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_comment" do
    assert_difference('DocumentComment.count') do
      post :create, document_comment: { comment: @document_comment.comment, rating: @document_comment.rating, task_id: @document_comment.task_id }
    end

    assert_redirected_to document_comment_path(assigns(:document_comment))
  end

  test "should show document_comment" do
    get :show, id: @document_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_comment
    assert_response :success
  end

  test "should update document_comment" do
    patch :update, id: @document_comment, document_comment: { comment: @document_comment.comment, rating: @document_comment.rating, task_id: @document_comment.task_id }
    assert_redirected_to document_comment_path(assigns(:document_comment))
  end

  test "should destroy document_comment" do
    assert_difference('DocumentComment.count', -1) do
      delete :destroy, id: @document_comment
    end

    assert_redirected_to document_comments_path
  end
end
