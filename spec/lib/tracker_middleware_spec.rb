require 'spec_helper'

module RedisTracker
  describe TrackerMiddleware do
    let(:app)       { double('App', call: [1,2,3]) }
    let(:redis_key) { RedisTracker.redis_key }
    let(:env)       { { 'REQUEST_PATH' => path } }

    subject { TrackerMiddleware.new(app) }

    context 'when it is not an assaet' do
      let(:path) { '/path/1' }

      it 'call redis wrapper' do
        expect{ subject.call(env) }.to change { RedisTracker.redis.hget(redis_key, path) }
      end
    end

    context 'when it is an assaet' do
      let(:path) { '/javascript/lsls.js' }

      it 'not call redis wrapper' do
        expect{ subject.call(env) }.not_to change { RedisTracker.redis.hget(redis_key, path) }
      end
    end
  end
end
