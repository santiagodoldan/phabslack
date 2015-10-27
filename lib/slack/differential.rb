module Slack
  class Differential

    def self.notify_pending!
      message = "*Needs Review:*\n"

      Phabricator::Differential.needs_review.each do |revision|
        message << "\t<#{revision.uri}|#{revision.title}> by #{revision.author.name}\n"
      end

      message << "*Needs Revision:*\n"

      Phabricator::Differential.needs_revision.each do |revision|
        message << "\t<#{revision.uri}|#{revision.title}> by #{revision.author.name}\n"
      end

      message << "*Accepted:*\n"

      Phabricator::Differential.accepted.each do |revision|
        message << "\t<#{revision.uri}|#{revision.title}> by #{revision.author.name}\n"
      end

      Slack.notifier.ping(message)
    end

  end
end
