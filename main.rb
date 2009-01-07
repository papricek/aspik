#Require libraries
%w(rubygems sinatra activerecord erb yaml).each do |lib|
  require lib
end

#Require Aspik files
Dir["app/*.rb"].each do |lib|
  require lib
end

get '/' do
  Aspik::Configuration::CONFIG['site']['title']
end

configure :production do
  not_found do
    File.read( File.join( File.dirname(__FILE__), 'public', '404.html') )
  end
  error do
    File.read( File.join( File.dirname(__FILE__), 'public', '500.html') )
  end
end
