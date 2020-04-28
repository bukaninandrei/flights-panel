# frozen_string_literal: true

module FlightService
  module_function

  def launch_all(flight_ids)
    return if flight_ids.empty?

    flights = Flight.where(id: flight_ids).order(:id).all

    flights.each(&:prepare_to_flight!)
  end
end
