%w(rubygems sinatra activerecord erb yaml stringex).each do |lib|
  require lib
end

Dir["app/*.rb"].each do |lib|
  require lib
end

get '/' do
  erb :index
end

get '/admin' do
  erb :admin, :layout => :layout_admin
end

configure do
  Aspik::System.connect_to_database
end

configure :production do
  not_found do
    File.read( File.join( File.dirname(__FILE__), 'public', '404.html') )
  end
  error do
    File.read( File.join( File.dirname(__FILE__), 'public', '500.html') )
  end
end

helpers do

  include Rack::Utils
  alias_method :h, :escape_html

  def hostname
    (request.env['HTTP_X_FORWARDED_SERVER'] =~ /[a-z]*/) ? request.env['HTTP_X_FORWARDED_SERVER'] : request.env['HTTP_HOST']
  end

  def link_to(*args)
    name = args.first
    url = args.second || ""
    html_options = args.third

    if html_options
      html_options = html_options.stringify_keys
      href = html_options['href']
      attributes = html_option.map{|key, value| "#{key}='#{value}'"}.join(" ")
    end

    href_attr = "href=\"#{url}\"" unless href
    "<a #{href_attr}#{attributes}>#{name || url}</a>"
  end
  
end