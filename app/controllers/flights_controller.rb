# frozen_string_literal: true

class FlightsController < ApplicationController
  include Pagy::Backend

  def index
    @pager, @flights = pagy(Flight.order(:id).all)
  end

  def update
    flight = Flight.find(flight_params[:id])
    flight.prepare_to_flight!

    head :ok
  end

  private

  def flight_params
    {
      id: params.require(:id).to_i
    }
  end
end
