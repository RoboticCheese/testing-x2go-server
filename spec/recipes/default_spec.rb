# Encoding: UTF-8

require_relative '../spec_helper'

describe 'x2go-server::default' do
  let(:platform) { { platform: 'ubuntu', version: '14.04' } }
  let(:runner) { ChefSpec::SoloRunner.new(platform) }
  let(:chef_run) { runner.converge(described_recipe) }

  it 'creates an x2go_server resource' do
    expect(chef_run).to create_x2go_server('default')
  end
end
