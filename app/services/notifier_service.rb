module NotifierService
  module_function

  def notify_dispatchers(flight)
    Rails.logger.info("All dispatchers notified about #{flight.title}")
    ActionCable.server.broadcast(
      'flight_room',
      flight_id: flight.id,
      state_human: flight.aasm.human_state,
      actions_allowed: flight.in_garage?
    )
  end
end