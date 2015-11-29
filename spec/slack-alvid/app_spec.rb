require 'spec_helper'

describe SlackAlvid::App do
  def app
    SlackAlvid::App.new
  end

  it_behaves_like 'a slack ruby bot'
end
