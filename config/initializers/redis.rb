config = Rails.application.config_for(:redis)

if config.present?
  client = Redis.new(
    url: "#{config['redis_base_url']}/#{config['redis_default_db']}"
  )

  Redis.current = Redis::Namespace.new("iv:#{config['redis_namespace']}", redis: client)
end
