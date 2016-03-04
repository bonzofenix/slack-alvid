require 'spec_helper'

describe SlackAlvid do
  describe 'load_config' do
    it 'should load configs correctly' do
      expect(SlackAlvid.config).to be_nil
      SlackAlvid.load_config 'config/test.yml'
    expect(SlackAlvid.config.commands.repo.servers.public.api_endpoint).to match(/github/)
    end
  end
end
