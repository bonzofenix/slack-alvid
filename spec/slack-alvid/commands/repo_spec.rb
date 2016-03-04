require 'spec_helper'

describe SlackAlvid::Commands::Repo do
  let(:access_token){ 'asd123' }
  let(:api_endpoint){ 'https://myenterprise.github.com/api/v3/' }
  let(:github_client){ double('Alvid::Github', create_repository: private_key) }
  let(:private_key){ 'a private key' }
  let(:config) do
    {
      'commands' => {
        'repo' => {
          'server' => {
            'public' => {
              'access_token' => access_token,
              'api_endpoint' => api_endpoint
            }
          }
        }
      }
    }
  end
  let(:repo_name){ 'dummy-name' }
  let(:organization){ 'dummy-org' }

  def app
    SlackAlvid::App.new
  end

  before do
    $config = RecursiveOpenStruct.new(config)
  end

  describe 'create' do
    it 'calls any instance of Alvid::Github.create_repository' do
      expect(Alvid::Github).to receive(:new).with(api_endpoint, access_token).and_return(github_client)
      expect(github_client).to receive(:create_repository).with(repo_name, organization).and_return(private_key)
      expect(message: "#{SlackRubyBot.config.user} repo create public dummy-org dummy-name", channel: 'channel').to respond_with_slack_message("REPO CREATED!\nPRIVATE KEY:\n#{private_key}")
    end
  end

  after do
    $config = nil
  end
end
