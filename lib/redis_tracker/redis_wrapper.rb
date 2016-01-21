module RedisTracker
  class RedisWrapper
    def initialize(url_path)
      @url_path = url_path
    end

    def write
      fetch ? increment : register
    end

    private
    attr_reader :url_path, :redis
    def register
      redis.hset(RedisTracker.redis_key, url_path, '1')
    end

    def increment
      redis.hincrby(RedisTracker.redis_key, url_path, 1)
    end

    def fetch
      redis.hget(RedisTracker.redis_key, url_path)
    end

    def redis
      RedisTracker.redis
    end
  end
end
