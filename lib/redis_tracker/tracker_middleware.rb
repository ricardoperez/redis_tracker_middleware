require "redis_tracker/redis_wrapper"

module RedisTracker
  class TrackerMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call env
      request_path = env['REQUEST_PATH']
      RedisWrapper.new(request_path).write unless asset_content?(request_path)
      [status, headers, body]
    end

    private
    def asset_content?(request_path)
      request_path.match /javascript|stylesheets|images|\.ico/
    end
  end
end
