#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'phabulous'
require 'slack-notifier'
require 'byebug'

require_relative 'lib/phabricator'
require_relative 'lib/slack'

Phabulous.configure do |config|
  config.host = Phabricator.config['host']
  config.user = Phabricator.config['user']
  config.cert = Phabricator.config['cert']
end

Phabulous.connect!

Slack::Differential.notify_pending!

