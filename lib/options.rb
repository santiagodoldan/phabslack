class Options

  def initialize(filename)
    @filename = filename
  end

  def [](name)
    config[name]
  end

  private

  def config
    env = ENV['ENV'] || 'development'

    @config ||= YAML.load_file(File.join(File.dirname(__FILE__), "../config/#{@filename}.yml"))[env]
  end

end
