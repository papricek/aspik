module Aspik
  module Configuration

    CONFIG = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), '..', 'config', 'config.yml'))).result)
    DATABASE = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), '..', 'config', 'database.yml'))).result)
    DATA_DIRECTORY = CONFIG['data_directory']

  end

  class Utils

    def self.connect_to_database
      path = File.join( File.dirname(__FILE__), '..', 'data', 'database.rb' )
      puts path
      ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => path)
    end
  end

end