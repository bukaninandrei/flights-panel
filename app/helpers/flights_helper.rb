# frozen_string_literal: true

module FlightsHelper
  include Pagy::Frontend

  def han(object, attribute)
    object.human_attribute_name(attribute)
  end

  def timings_from_flight(flight)
    timings = {
      in_garage: flight.created_at,
      waiting_flight: nil,
      on_air: nil
    }
    flight.events.each_with_object(timings) do |event, acc|
      acc[event.type.to_sym] = event.created_at
    end
  end
end
