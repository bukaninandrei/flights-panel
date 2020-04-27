module NotifierService
  module_function

  def notify_dispatchers(flight)
    Rails.logger.info("All dispatchers notified about #{flight.title}")
  end
end