# frozen_string_literal: true

if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { url: ENV.fetch("REDISCLOUD_URL", nil), network_timeout: 5 }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: ENV.fetch("REDISCLOUD_URL", nil) }
  end
end
