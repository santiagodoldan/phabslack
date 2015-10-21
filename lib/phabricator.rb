require_relative 'options'
require_relative 'phabricator/differential'

module Phabricator

  def self.config
    @config ||= Options.new('phabricator')
  end

end
