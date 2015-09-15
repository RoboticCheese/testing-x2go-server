# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/provider_x2go_server_app'

describe Chef::Provider::X2goServerApp do
  let(:name) { 'default' }
  let(:new_resource) { Chef::Resource::X2goServerApp.new(name, nil) }
  let(:provider) { described_class.new(new_resource, nil) }

  describe '#whyrun_supported?' do
    it 'returns true' do
      expect(provider.whyrun_supported?).to eq(true)
    end
  end

  describe '#action_install' do
    it 'installs the app' do
      p = provider
      expect(p).to receive(:install!)
      p.action_install
    end
  end

  describe '#action_remove' do
    it 'removes the app' do
      p = provider
      expect(p).to receive(:remove!)
      p.action_remove
    end
  end

  describe '#install!' do
    it 'raises an error' do
      expect { provider.send(:install!) }.to raise_error(NotImplementedError)
    end
  end

  describe '#remove!' do
    it 'raises an error' do
      expect { provider.send(:remove!) }.to raise_error(NotImplementedError)
    end
  end
end
