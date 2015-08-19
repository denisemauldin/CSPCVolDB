require 'test_helper'

class PositionsControllerTest < ActionController::TestCase
  setup do
    @position = positions(:one)
  end

  # Tests should succeed with admin user
  test "should get index" do
    sign_in users(:admin)  
    get :index
    assert_response :success
    assert_not_nil assigns(:positions)
  end

  test "should get new" do
    sign_in users(:admin)
    get :new
    assert_response :success
  end

  test "should create position" do
    sign_in users(:admin)
    assert_difference('Position.count') do
      post :create, position: { desc: @position.desc, name: @position.name, shadowing: @position.shadowing, training: @position.training }
    end

    assert_redirected_to position_path(assigns(:position))
  end

  test "should show position" do
    sign_in users(:admin)
    get :show, id: @position
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:admin)
    get :edit, id: @position
    assert_response :success
  end

  test "should update position" do
    sign_in users(:admin)
    patch :update, id: @position, position: { desc: @position.desc, name: @position.name, shadowing: @position.shadowing, training: @position.training }
    assert_redirected_to position_path(assigns(:position))
  end

  test "should destroy position" do
    sign_in users(:admin)
    assert_difference('Position.count', -1) do
      delete :destroy, id: @position
    end

    assert_redirected_to positions_path
  end
  
  # test that non-admin users can't manage
  test "non-admin should not create position" do
    sign_in users(:doctor)
    assert_no_difference('Position.count') do
      post :create, position: { desc: @position.desc, name: @position.name, shadowing: @position.shadowing, training: @position.training }
    end
  end

  test "non-admin should not edit but redirect" do
    sign_in users(:doctor)
    get :edit, id: @position
    assert_response :redirect
  end
    
  test "non-admin should not update position but redirect" do
    sign_in users(:doctor)
    patch :update, id: @position, position: { desc: @position.desc, name: @position.name, shadowing: @position.shadowing, training: @position.training }
    assert_response :redirect
  end

  test "non-admin should not destroy position" do
    sign_in users(:doctor)
    assert_no_difference('Position.count', -1) do
      delete :destroy, id: @position
    end

    assert_response :redirect
  end
    
end
