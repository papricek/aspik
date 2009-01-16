require 'active_record'
require 'erb'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'app', 'configuration')


task :migrate_database do
  puts "Creating/Connecting and migrating database in #{Aspik::Configuration::DB['production']['database']}"
  Aspik::System.connect_to_database
  if ActiveRecord::Migrator.current_version < 1
    begin
      ActiveRecord::Schema.define(:version => 1) do
        create_table :articles do |t|
          t.string :title
          t.text :text
          t.timestamps
        end

        create_table :comments do |t|
          t.string :title
          t.text :text
          t.timestamps
        end

      end
      puts "Migration finished"
    rescue
      puts "Migration wasn't successfull"
    end
  end
end