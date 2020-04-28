require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get update" do
    flight = flights(:in_garage)

    patch flights_path(params: { id: flight.id })
    assert_response :success
  end
end