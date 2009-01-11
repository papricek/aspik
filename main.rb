#Require libraries
%w(rubygems sinatra activerecord erb yaml).each do |lib|
  require lib
end

#Require Aspik files
Dir["app/*.rb"].each do |lib|
  require lib
end

Aspik::Utils.connect_to_database

get '/' do
  "This is testing text rendered by Aspik engine"
end

configure :production do
  not_found do
    File.read( File.join( File.dirname(__FILE__), 'public', '404.html') )
  end
  error do
    File.read( File.join( File.dirname(__FILE__), 'public', '500.html') )
  end
end
