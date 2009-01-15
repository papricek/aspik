require 'rubygems'
require 'sinatra'

root = File.dirname(__FILE__)

Sinatra::Application.default_options.merge! \
  :run => false,
  :root => root,
  :app_file => File.join(root, 'main.rb'),
  :views => File.join(root, 'views'),
  :env => :production

load File.join(File.dirname(__FILE__), 'main.rb')

run Sinatra.application
