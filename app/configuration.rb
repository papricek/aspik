module Aspik
 
  CONFIG = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), '..', 'config', 'config.yml'))).result)
  DB = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), '..', 'config', 'database.yml'))).result)
 
  class System
    def self.connect_to_database
      ActiveRecord::Base.establish_connection(Aspik::DB)
    end
  end
end