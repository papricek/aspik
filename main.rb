#Require libraries
%w(rubygems sinatra activerecord erb yaml).each do |lib|
  require lib
end

#Require Aspik files
Dir["app/*.rb"].each do |lib|
  require lib
end

Aspik::System.connect_to_database

#TODO dodelat dalsi metody
get '/' do
  "development: #{development?}, production: #{production?}"
end

configure :production do
  not_found do
    File.read( File.join( File.dirname(__FILE__), 'public', '404.html') )
  end
  error do
    File.read( File.join( File.dirname(__FILE__), 'public', '500.html') )
  end
end
