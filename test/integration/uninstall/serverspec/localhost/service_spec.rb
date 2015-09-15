# Encoding: UTF-8

require_relative '../spec_helper'

describe 'x2go-server::service' do
  describe service('x2goserver') do
    it 'is not enabled' do
      expect(subject).to_not be_enabled
    end

    it 'is not running' do
      expect(subject).to_not be_running
    end
  end

  describe process('x2gocleansessions') do
    it 'is not running' do
      puts 'PROCESSES IN THIS CONTAINER'
      puts %x{ps -Af}
      puts '/PROCESSES IN THIS CONTAINER'
      expect(subject).to_not be_running
    end
  end
end
