require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    sign_in users(:admin)  
    get :new
    assert_response :success
  end

  test "should create event" do
    sign_in users(:admin)  
    assert_difference('Event.count') do
      post :create, event: { abbv: @event.abbv, default_location: @event.default_location, duration: @event.duration, name: @event.name, start: @event.start, recurring_schedule:  "{\"validations\":{\"day_of_week\":{\"1\":[2]}},\"rule_type\":\"IceCube::MonthlyRule\",\"interval\":1}" }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:admin)  
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    sign_in users(:admin)  
    patch :update, id: @event, event: { abbv: @event.abbv, default_location: @event.default_location, duration: @event.duration, name: @event.name, start: @event.start, recurring_schedule: "{\"validations\":{\"day_of_week\":{\"1\":[2]}},\"rule_type\":\"IceCube::MonthlyRule\",\"interval\":1}" }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    sign_in users(:admin)  
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
