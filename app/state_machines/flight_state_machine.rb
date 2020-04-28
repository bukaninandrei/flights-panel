# frozen_string_literal: true

module FlightStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :state do
      state :in_garage, initial: true
      state :waiting_flight, :on_air

      event :prepare_to_flight do
        transitions from: :in_garage,
                    to: :waiting_flight,
                    success: :notify_current_status
      end

      event :fly do
        transitions from: :waiting_flight,
                    to: :on_air,
                    success: :notify_current_status
      end
    end

    private

    def notify_current_status
      NotifierService.notify_dispatchers(self)
    end
  end
end
