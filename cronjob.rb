#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'phabulous'
require 'byebug'

Phabulous.configure do |config|
  config.host = ''
  config.user = ''
  config.cert = ''
end

