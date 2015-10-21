module Phabricator
  class Options

    def [](name)
      config[name]
    end

    private

    def config
      env = ENV['ENV'] || 'development'

      @config ||= YAML.load_file(File.join(File.dirname(__FILE__), "../../config/phabricator.yml"))[env]
    end

  end
end
