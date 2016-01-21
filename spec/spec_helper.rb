$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'redis_tracker'

RedisTracker.redis_key = 'tracker_testing'

RedisTracker.redis.del('tracker_testing')
