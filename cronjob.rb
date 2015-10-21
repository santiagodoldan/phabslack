#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'phabulous'
require 'byebug'

require_relative 'lib/phabricator'

phab = Phabricator::Options.new

Phabulous.configure do |config|
  config.host = phab['host']
  config.user = phab['user']
  config.cert = phab['cert']
end

Phabulous.connect!

usernames = [ 'santiago.doldan',
              'patricio.maite',
              'guzman.iglesias',
              'marianne.maisonneuve',
              'cristian.dotta',
              'ivan.etchart',
              'miguel.renom' ]

revisions = Phabulous.revisions.by_status(Phabulous::Revision::NEEDS_REVISION,
                                          Phabulous::Revision::NEEDS_REVIEW)

our_revisions = revisions.select { |revision| usernames.include?(revision.author.name) }

our_revisions.each do |revision|
  puts "#{revision.title} by #{revision.author.name}"
end

