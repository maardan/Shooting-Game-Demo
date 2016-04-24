require 'test_helper'

class GameroomsControllerTest < ActionController::TestCase
  setup do
    @gameroom = gamerooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gamerooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gameroom" do
    assert_difference('Gameroom.count') do
      post :create, gameroom: {  }
    end

    assert_redirected_to gameroom_path(assigns(:gameroom))
  end

  test "should show gameroom" do
    get :show, id: @gameroom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gameroom
    assert_response :success
  end

  test "should update gameroom" do
    patch :update, id: @gameroom, gameroom: {  }
    assert_redirected_to gameroom_path(assigns(:gameroom))
  end

  test "should destroy gameroom" do
    assert_difference('Gameroom.count', -1) do
      delete :destroy, id: @gameroom
    end

    assert_redirected_to gamerooms_path
  end
end
