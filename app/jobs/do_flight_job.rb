class DoFlightJob < ApplicationJob
  queue_as :default

  def perform(flight_id)
    flight = Flight.find(flight_id)

    Rails.logger.info("Preparing: #{flight.title} to fly")
    sleep 5
    flight.fly!
    Rails.logger.info("On air: #{flight.title}")

    NotifierService.notify_dispatchers(flight)
  end
end
