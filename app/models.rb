module Aspik

  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "#{Aspik::Configuration::DATA_DIRECTORY}/database.db")

  class Article < ActiveRecord::Base
    
  
  
  end
end

