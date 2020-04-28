# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq-scheduler'

rails_root = File.dirname(__FILE__) + '/../..'
rails_env = Rails.env || 'development'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/1' }
  config.average_scheduled_poll_interval = 3

  config.on(:startup) do
    if rails_env != 'test'
      Sidekiq.schedule = YAML.load_file(rails_root + '/config/sidekiq_schedule.yml')
    end
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/1' }
end
