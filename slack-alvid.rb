require 'slack-ruby-bot'
require 'slack-alvid/commands/retro'
require 'slack-alvid/commands/repo'
require 'slack-alvid/app'
require 'slack-alvid/web'

module SlackAlvid
  def self.config
    $config
  end

  def self.load_config(config_path)
    $config = RecursiveOpenStruct.new(YAML.load_file(config_path))
  end
end
