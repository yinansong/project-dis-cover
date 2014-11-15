require 'test_helper'

class ManholecoversControllerTest < ActionController::TestCase
  setup do
    @manholecover = manholecovers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manholecovers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manholecover" do
    assert_difference('Manholecover.count') do
      post :create, manholecover: {  }
    end

    assert_redirected_to manholecover_path(assigns(:manholecover))
  end

  test "should show manholecover" do
    get :show, id: @manholecover
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manholecover
    assert_response :success
  end

  test "should update manholecover" do
    patch :update, id: @manholecover, manholecover: {  }
    assert_redirected_to manholecover_path(assigns(:manholecover))
  end

  test "should destroy manholecover" do
    assert_difference('Manholecover.count', -1) do
      delete :destroy, id: @manholecover
    end

    assert_redirected_to manholecovers_path
  end
end
