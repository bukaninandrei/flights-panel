# frozen_string_literal: true

class DoFlightWorker
  include Sidekiq::Worker

  sidekiq_options unique_across_workers: true, queue: 'default'

  def perform
    flight_groups = Flight.where(state: :waiting_flight)
                          .order(:updated_at)
                          .find_in_batches(batch_size: 10)

    flight_groups.each do |flight_group|
      flight_group.each { |flight| launch_flee(flight) }
    end
  end

  private

  def launch_flee(flight)
    Rails.logger.info("Preparing: #{flight.title} to fly")

    run_flight_run(flight)

    Rails.logger.info("On air: #{flight.title}")
  end

  def run_flight_run(flight)
    sleep configus.flight_time
    flight.fly!
  end
end
