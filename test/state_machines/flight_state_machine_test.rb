# frozen_string_literal: true

require 'test_helper'

class FlightStateMachineTest < ActiveJob::TestCase
  test 'from waiting_flight to on_air' do
    flight = flights('waiting')

    assert_changes -> { flight.state }, from: 'waiting_flight', to: 'on_air' do
      flight.fly!
    end
  end

  test 'from in_garage to waiting_flight' do
    flight = flights('in_garage')

    assert_changes -> { flight.state }, from: 'in_garage', to: 'waiting_flight' do
      flight.prepare_to_flight!
    end
  end
end
