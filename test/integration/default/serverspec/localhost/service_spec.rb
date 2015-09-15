# Encoding: UTF-8

require_relative '../spec_helper'

describe 'x2go-server::service' do
  describe service('x2goserver') do
    it 'is enabled' do
      expect(subject).to be_enabled
    end

    it 'is running' do
      expect(subject).to be_running
    end
  end

  describe process('x2gocleansessions') do
    it 'is running' do
      expect(subject).to be_running
    end
  end
end
