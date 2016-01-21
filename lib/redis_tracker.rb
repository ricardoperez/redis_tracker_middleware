require "redis_tracker/version"
require "redis_tracker/tracker_middleware"
require "redis"

module RedisTracker
  def self.redis_host_url
    @redis_host || 'redis://127.0.0.1:6379'
  end

  def self.redis_key
    @redis_key || 'url_tracker'
  end

  def self.redis_key=(key)
    @redis_key = key
  end

  def self.redis_host=(redis_url)
    @redis_host = redis_url
  end

  def self.redis
    @redis ||= Redis.new url: @redis_host_url
  end
end
