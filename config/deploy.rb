require 'capistrano/version'
require 'rubygems'
#require 'capinatra'
load 'deploy' if respond_to?(:namespace) # cap2 differentiator


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
set :data_directory, "var/www/papricek/#{application}/shared/data"

# scm settings
set :repository, "git@github.com:papricek/cms_on_sinatra.git"
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

after "deploy:cold" do
  run "cd #{current_path}; rake app:install:create_data_directory; rake app:install:create_database;"
end

after :deploy do
  run "cd #{current_path}; rake app:install:create_links"
end


namespace :app do
  namespace :install do

    task :create_data_directory do
      puts "Creating data directory in " + data_directory
      FileUtils.mkdir_p( data_directory )
    end

    task :create_links do
      run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml "
      run "ln -nfs #{deploy_to}/shared/data/database.db #{release_path}/config/database.db "
    end



    task :create_database do
      puts "Creating database in #{data_directory}/database.db"
      ActiveRecord::Base.establish_connection( :adapter => 'sqlite3',
        :database => File.join(data_directory, 'database.db')
      )
      load( File.join( File.dirname(__FILE__), 'config', 'migrations.rb' ) )
    end
  end
end
