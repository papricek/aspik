#Require libraries
%w(rubygems sinatra activerecord erb yaml).each do |lib|
  require lib
end

#Require files
%w(models).each do |file|
  require file
end

get '/' do
  'Hello world!'
end

configure  do
  ActiveRecord::Base.configurations = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), 'config', 'database.yml'))).result)
  ActiveRecord::Base.establish_connection( :adapter => 'sqlite3', :database => File.join(DATA_DIRECTORY, 'comments.db') )
end

configure :production do
  not_found do
    File.read( File.join( File.dirname(__FILE__), 'public', '404.html') )
  end
  error do
    File.read( File.join( File.dirname(__FILE__), 'public', '500.html') )
  end
end
