require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

#redirect when not logged in
  test "should be redirected when trying new and not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should be logged in to post a new status" do
    post :create, status: {content: "Hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should redirect status update when not logged in" do
    put :update, id: @status, status: { content: @status.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
#end redirect when not logged in

#Logged in

  test "should show status when logged in" do
    sign_in users(:jason)
    get :show, id: @status
    assert_response :success
  end

  test "should render the new page when logged in" do
    sign_in users(:jason)
    get :new
    assert_response :success
  end

  test "should create status when logged in" do
    sign_in users(:jason)
    assert_difference('Status.count')
    post :create, status: { content: @status.content}
  end

  test "should get edit when logged in" do
    sign_in users(:jason)
    get :edit, id: @status
    assert_response :success 
  end

  test "should update status" do
    sign_in users(:jason)
    put :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should be logged in to destroy status" do
    sign_in users(:jason)
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end
    assert_redirected_to statuses_path
  end
#fin de ceux logged in

end
