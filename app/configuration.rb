module Aspik
  module Configuration

    CONFIG = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), '..', 'config', 'config.yml'))).result)

    DATA_DIRECTORY = CONFIG['data_directory']

  end


end