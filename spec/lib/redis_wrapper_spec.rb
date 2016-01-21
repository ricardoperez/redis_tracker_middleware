require 'spec_helper'

module RedisTracker
  describe RedisWrapper do
    let(:url_path) { '/some/path/url' }

    context 'when the url is new' do
      subject { RedisWrapper.new url_path }

      it 'creates a new register' do
        expect(subject.write).to eq(true)
      end
    end

    context 'when is already registered url' do
      subject { RedisWrapper.new url_path }

      it 'creates a new register' do
        expect(subject.write).to eq(2)
      end
    end
  end
end
