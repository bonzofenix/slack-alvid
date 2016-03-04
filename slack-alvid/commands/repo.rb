
require 'alvid/github'

module SlackAlvid
  module Commands
    class Repo < SlackRubyBot::Commands::Base
      command 'repo create' do |client, data, _match|
        server, organization, repo_name = data.fetch('text').split('repo create')[1].strip.split(' ')
        conf = SlackAlvid.config.commands.repo.server.send(server)
        github_client = Alvid::Github.new( conf.api_endpoint, conf.access_token)
        private_key = github_client.create_repository(repo_name, organization)

        send_message client, data.channel, "REPO CREATED!\nPRIVATE KEY:\n#{private_key}"
      end
    end
  end
end
