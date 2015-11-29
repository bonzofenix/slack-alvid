require 'spec_helper'

describe SlackAlvid::Commands::Retro do
  def app
    SlackAlvid::App.new
  end

  describe 'add' do
    it 'calls Alvid::Retro.add' do
      expect(Alvid::Retro).to receive(:add).with('banana')
      expect(message: "#{SlackRubyBot.config.user} retro add banana", channel: 'channel').to respond_with_slack_message('item added')
    end
  end

  describe 'list' do
    it 'calls Alvid::Retro.list' do
      allow( Alvid::Retro ).to receive(:list) { 'bananas' }
      expect(message: "#{SlackRubyBot.config.user} retro list", channel: 'channel').to respond_with_slack_message('bananas')
    end
  end

  describe 'clear' do
    it 'calls Alvid::Retro.list' do
      expect(Alvid::Retro).to receive(:clear)
      expect(message: "#{SlackRubyBot.config.user} retro clear", channel: 'channel').to respond_with_slack_message('list cleared')
    end
  end
end
