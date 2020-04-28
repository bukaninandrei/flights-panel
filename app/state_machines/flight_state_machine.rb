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
                    success: :put_in_queue
      end

      event :fly do
        transitions from: :waiting_flight, to: :on_air
      end
    end

    private

    def put_in_queue
      NotifierService.notify_dispatchers(self)
      DoFlightJob.perform_later(self.id)
    end
  end
end