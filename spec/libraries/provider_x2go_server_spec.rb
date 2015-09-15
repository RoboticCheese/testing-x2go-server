# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/provider_x2go_server'

describe Chef::Provider::X2goServer do
  let(:name) { 'default' }
  let(:new_resource) { Chef::Resource::X2goServer.new(name, nil) }
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

  describe '#action_create' do
    before(:each) do
      [:x2go_server_app, :x2go_server_service].each do |m|
        allow_any_instance_of(described_class).to receive(m)
      end
    end

    it 'installs the X2go server app' do
      p = provider
      expect(p).to receive(:x2go_server_app).with(name).and_yield
      expect(p).to receive(:source).with(nil)
      p.action_create
    end

    it 'enables and starts the X2go server service' do
      p = provider
      expect(p).to receive(:x2go_server_service).with(name)
      p.action_create
    end
  end

  describe '#action_remove' do
    before(:each) do
      [:x2go_server_service, :x2go_server_app].each do |m|
        allow_any_instance_of(described_class).to receive(m)
      end
    end

    it 'stops and disables the X2go server service' do
      p = provider
      expect(p).to receive(:x2go_server_service).with(name).and_yield
      expect(p).to receive(:action).with([:stop, :disable])
      p.action_remove
    end

    it 'removes the X2go server app' do
      p = provider
      expect(p).to receive(:x2go_server_app).with(name).and_yield
      expect(p).to receive(:action).with(:remove)
      p.action_remove
    end
  end
end
