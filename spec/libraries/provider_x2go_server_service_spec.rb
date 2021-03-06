# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/provider_x2go_server_service'

describe Chef::Provider::X2goServerService do
  let(:name) { 'default' }
  let(:new_resource) { Chef::Resource::X2goServerService.new(name, nil) }
  let(:provider) { described_class.new(new_resource, nil) }

  describe '.provides?' do
    let(:platform) { nil }
    let(:node) { ChefSpec::Macros.stub_node('node.example', platform) }
    let(:res) { described_class.provides?(node, new_resource) }

    context 'Ubuntu' do
      let(:platform) { { platform: 'ubuntu', version: '14.04' } }

      it 'returns true' do
        expect(res).to eq(true)
      end
    end
  end

  describe '#whyrun_supported?' do
    it 'returns true' do
      expect(provider.whyrun_supported?).to eq(true)
    end
  end

  [:enable, :disable, :start, :stop, :restart, :reload].each do |a|
    describe "#action_#{a}" do
      it 'passes the action onto a Chef service resource' do
        p = provider
        expect(p).to receive(:service).with('x2goserver').and_yield
        expect(p).to receive(:status_command).with('ps h -C x2gocleansessions')
        expect(p).to receive(:action).with(a)
        p.send("action_#{a}")
      end
    end
  end
end
