class FlightsController < ApplicationController
  include Pagy::Backend

  def index
    @pager, @flights = pagy(Flight.order(:id).all)
  end

  def update
  end
end
