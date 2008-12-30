require 'rubygems'
require 'activerecord'
require 'rake'
require 'ftools'

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
