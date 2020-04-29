# frozen_string_literal: true

require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should patch perform_event' do
    flight = flights(:in_garage)

    patch flights_perform_event_path(params: { ids: [flight.id] })
    assert_response :success
  end

  test 'should get show' do
    flight_events(:flight_waiting, :flight_on_air)
    flight = flights(:on_air)

    assert_equal 2, flight.events.length

    get flight_path(flight)
    assert_response :success
  end
end
