require 'capistrano/version'
require 'rubygems'
require 'yaml'
#require 'capinatra'
load 'deploy' if respond_to?(:namespace) # cap2 differentiator

CONFIG = YAML.load_file( File.join(File.dirname(__FILE__), 'config.yml') ) unless defined? CONFIG

# app settings
set :app_file, "main.rb"
set :application, "semantickyweb.cz"
set :domain, "semantickyweb.cz"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

# general settings
set :user, "papricek"
set :use_sudo, false
set :deploy_to, "/var/www/papricek/#{application}"
set :deploy_via, :remote_cache
set :apache_vhost_dir, "/etc/apache2/sites-enabled"
set :data_directory, "/var/www/papricek/#{application}/shared/data"

# scm settings
set :repository, "git@github.com:papricek/aspik.git"
set :scm, "git"
set :scm_passphrase, ""
set :scm_verbose, true
set :branch, "master"
#set :git_enable_submodules, 1


namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy do
  app.install.create_data_directory
  app.install.create_links
  app.install.create_database
end


namespace :app do
  namespace :install do

    task :create_data_directory do
      puts "Creating data directory in " + data_directory
      run "mkdir -p #{data_directory}"
    end

    task :create_links do
      puts "Creating links to /config/database.yml and /data"
      run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml "
      run "ln -nfs #{deploy_to}/shared/data/ #{release_path}/data"
    end

    task :create_database do
      puts "Creating database in #{data_directory}/database.db"
      load( File.join( File.dirname(__FILE__), 'migrations.rb' ) )
    end
  end
end
