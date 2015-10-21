require_relative 'options'
require_relative 'slack/differential'

module Slack

  def self.config
    @config ||= Options.new('slack')
  end

  def self.notifier
    @notifier ||= Slack::Notifier.new(Slack.config['url'])
  end

end
