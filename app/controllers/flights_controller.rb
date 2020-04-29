# frozen_string_literal: true

class FlightsController < ApplicationController
  include Pagy::Backend

  def index
    @pager, @flights = pagy(Flight.order(:id).all)
  end

  def update
    FlightService.launch_all(flight_params[:ids])

    head :ok
  end

  def show
    @flight = Flight.find(params[:id])
    render layout: false
  end

  private

  def flight_params
    {
      ids: params.require(:ids).map(&:to_i)
    }
  end
end
