module Slack
  class Differential

    def self.notify_pending!
      message = ''

      if (needs_review = Phabricator::Differential.needs_review).any?
        message << "*Needs Review:*\n"

        needs_review.each do |revision|
          message << "\t<#{revision.uri}|#{revision.title}> by #{revision.author.name}\n"
        end
      end

      if (needs_revision = Phabricator::Differential.needs_revision).any?
        message << "*Needs Revision:*\n"

        needs_revision.each do |revision|
          message << "\t<#{revision.uri}|#{revision.title}> by #{revision.author.name}\n"
        end
      end

      if (accepted = Phabricator::Differential.accepted).any?
        message << "*Accepted:*\n"

        accepted.each do |revision|
          message << "\t<#{revision.uri}|#{revision.title}> by #{revision.author.name}\n"
        end
      end

      Slack.notifier.ping(message) unless message.empty?
    end

  end
end
