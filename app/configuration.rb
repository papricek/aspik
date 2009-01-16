module Aspik
  module Configuration
    CONFIG = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), '..', 'config', 'config.yml'))).result)
    DB = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), '..', 'config', 'database.yml'))).result)
    DATA_DIRECTORY = CONFIG['data_directory'] 
  end

  class System
    def self.connect_to_database
      ActiveRecord::Base.establish_connection(Aspik::Configuration::DB[Sinatra.env])
    end
  end
end