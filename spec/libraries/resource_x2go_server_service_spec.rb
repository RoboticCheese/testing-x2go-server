# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/resource_x2go_server_service'

describe Chef::Resource::X2goServerService do
  let(:name) { 'default' }
  let(:resource) { described_class.new(name, nil) }

  describe '#initialize' do
    it 'sets the correct resource name' do
      expect(resource.resource_name).to eq(:x2go_server_service)
    end

    it 'sets the correct default action' do
      expect(resource.action).to eq([:enable, :start])
    end
  end

  describe '#service_name' do
    it 'returns "x2goserver"' do
      expect(resource.service_name).to eq('x2goserver')
    end
  end
end
