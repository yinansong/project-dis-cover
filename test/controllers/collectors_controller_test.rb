require 'test_helper'

class CollectorsControllerTest < ActionController::TestCase
  setup do
    @collector = collectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collector" do
    assert_difference('Collector.count') do
      post :create, collector: {  }
    end

    assert_redirected_to collector_path(assigns(:collector))
  end

  test "should show collector" do
    get :show, id: @collector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collector
    assert_response :success
  end

  test "should update collector" do
    patch :update, id: @collector, collector: {  }
    assert_redirected_to collector_path(assigns(:collector))
  end

  test "should destroy collector" do
    assert_difference('Collector.count', -1) do
      delete :destroy, id: @collector
    end

    assert_redirected_to collectors_path
  end
end
