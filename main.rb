#Require libraries
%w(rubygems sinatra activerecord erb yaml).each do |lib|
  require lib
end

#Require CMS files
%w(models configuration).each do |file|
  require "app/#{file}"
end

get '/' do
  'Hello worlfffd!'
end

configure :production do
  not_found do
    File.read( File.join( File.dirname(__FILE__), 'public', '404.html') )
  end
  error do
    File.read( File.join( File.dirname(__FILE__), 'public', '500.html') )
  end
end
