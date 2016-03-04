$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-alvid'

Thread.new do
  begin
    SlackAlvid::App.instance.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

SlackAlvid.load_config "config/#{ENV['RACK_ENV']}.yml"

run SlackAlvid::Web
