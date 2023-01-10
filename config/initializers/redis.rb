$redis = Redis.new(url: ENV.fetch("REDISCLOUD_URL"), ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
