# frozen_string_literal: true

class Flight < ApplicationRecord
  include FlightStateMachine
end
