# frozen_string_literal: true

if Rails.env.production?
  $redis = Redis.new(url: ENV.fetch("REDISCLOUD_URL"), ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
end
