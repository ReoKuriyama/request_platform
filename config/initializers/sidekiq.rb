config = Rails.application.config_for(:redis)

if config.present?
  redis = {
    url: "#{config['redis_base_url']}/#{config['redis_sidekiq_db']}",
    namespace: "iv:sidekiq:#{config['redis_namespace']}"
  }

  Sidekiq.configure_client do |sidekiq_config|
    sidekiq_config.redis = redis
  end

  Sidekiq.configure_server do |sidekiq_config|
    sidekiq_config.redis = redis
    sidekiq_config.error_handlers << proc { |exception, context_hash| Airbrake.notify(exception, parameters: context_hash) }
  end

  # sidekiq-cron
  if Sidekiq.server?
    schedule_file = Rails.root.join('config', 'sidekiq_cron.yml')
    schedules = YAML.safe_load(File.read(schedule_file))

    Sidekiq::Cron::Job.load_from_array!(schedules)
  end
end
