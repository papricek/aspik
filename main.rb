%w(rubygems sinatra activerecord erb yaml).each do |lib|
  require lib
end

Dir["app/*.rb"].each do |lib|
  require lib
end

get '/' do
  "#{Sinatra.env}"
end

configure do

  Aspik::System.connect_to_database
  puts "Sinatra.application.options.env"
end

configure :production do
  not_found do
    File.read( File.join( File.dirname(__FILE__), 'public', '404.html') )
  end
  error do
    File.read( File.join( File.dirname(__FILE__), 'public', '500.html') )
  end
end
