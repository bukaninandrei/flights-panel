class FlightsController < ApplicationController
  include Pagy::Backend

  def index
    @pager, @records = pagy(Flight.all)
  end

  def update
  end
end
