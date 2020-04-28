# frozen_string_literal: true

class FlightChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'flight_room'
  end
end
