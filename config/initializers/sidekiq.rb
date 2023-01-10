# frozen_string_literal: true

if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = {
      url: ENV.fetch("REDISCLOUD_URL", nil),
      network_timeout: 5,
      ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      url: ENV.fetch("REDISCLOUD_URL", nil),
      ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
    }
  end
end
