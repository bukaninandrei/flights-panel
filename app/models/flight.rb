# frozen_string_literal: true

class Flight < ApplicationRecord
  has_many :events, dependent: :delete_all

  include FlightStateMachine

  before_save :touch_updated_at

  private

  def touch_updated_at
    self.updated_at = Time.zone.now
  end
end
