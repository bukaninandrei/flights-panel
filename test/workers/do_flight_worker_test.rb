require 'test_helper'

class DoFlightWorkerTest < ActiveJob::TestCase
  test 'flight enqueued' do
    flight = flights(:in_garage)

    assert_equal 0, DoFlightWorker.jobs.size

    flight.prepare_to_flight!
    DoFlightWorker.perform_async(flight.id)

    assert_equal 1, DoFlightWorker.jobs.size

    DoFlightWorker.clear
  end

  test 'waiting flight performed' do
    flight_in_garage = flights(:in_garage)
    flight_waiting = flights(:waiting)

    assert_changes -> { flight_waiting.state }, from: 'waiting_flight', to: 'on_air' do
      DoFlightWorker.new.perform
      flight_waiting.reload
    end

    assert_no_changes -> { flight_in_garage.state } do
      flight_in_garage.reload
    end
  end
end
