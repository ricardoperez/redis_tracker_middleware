require 'spec_helper'

describe RedisTracker do
  it 'has a version number' do
    expect(RedisTracker::VERSION).not_to be nil
  end
end
