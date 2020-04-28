# frozen_string_literal: true

class Flight < ApplicationRecord
  include FlightStateMachine

  before_save :touch_updated_at

  private

  def touch_updated_at
    self.updated_at = Time.zone.now
  end
end
