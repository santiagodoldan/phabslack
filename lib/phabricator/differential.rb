module Phabricator
  class Differential

    USERNAMES = [ 'santiago.doldan', 'patricio.maite', 'guzman.iglesias', 'marianne.maisonneuve',
                  'cristian.dotta', 'ivan.etchart', 'miguel.renom' ]

    def self.needs_review
      revision_by_status(Phabulous::Revision::NEEDS_REVIEW)
    end

    def self.needs_revision
      revision_by_status(Phabulous::Revision::NEEDS_REVISION)
    end

    def self.accepted
      revision_by_status(Phabulous::Revision::ACCEPTED)
    end

    private
      def self.revision_by_status(status)
        Phabulous.revisions.by_status(status)
          .select { |revision| USERNAMES.include?(revision.author.name) }
      end
  end
end
