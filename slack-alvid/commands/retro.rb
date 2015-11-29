
require 'alvid/retro'

module SlackAlvid
  module Commands
    class Retro < SlackRubyBot::Commands::Base
      command 'retro add' do |client, data, _match|
        Alvid::Retro.add data.fetch('text').split('retro add')[1].strip
        send_message client, data.channel, 'item added'
      end

      command 'retro list' do |client, data, _match|
        send_message client, data.channel, Alvid::Retro.list
      end

      command 'retro clear' do |client, data, _match|
        Alvid::Retro.clear
        send_message client, data.channel, 'list cleared'
      end
    end
  end
end
