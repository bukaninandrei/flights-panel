require 'test_helper'

class DoFlightJobTest < ActiveJob::TestCase
  include ActiveJob::TestHelper

  setup do
    @old_adapter = ActiveJob::Base.queue_adapter
    ActiveJob::Base.queue_adapter = :test
  end

  teardown do
    ActiveJob::Base.queue_adapter = @old_adapter
  end

  test "flight enqueued" do
    flight = flights(:in_garage)

    perform_enqueued_jobs(only: DoFlightJob) do
      flight.prepare_to_flight!
    end

    assert_performed_jobs 1
  end
end
