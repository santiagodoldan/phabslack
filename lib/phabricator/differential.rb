module Phabricator
  class Differential

    USERNAMES = [ 'santiago.doldan', 'patricio.maite', 'guzman.iglesias', 'marianne.maisonneuve',
                  'cristian.dotta', 'ivan.etchart', 'miguel.renom' ]

    def self.needs_review
      Phabulous.revisions.by_status(Phabulous::Revision::NEEDS_REVIEW).
        select { |revision| USERNAMES.include?(revision.author.name) }
    end

    def self.needs_revision
      Phabulous.revisions.by_status(Phabulous::Revision::NEEDS_REVISION).
        select { |revision| USERNAMES.include?(revision.author.name) }
    end

  end
end
