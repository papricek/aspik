require 'active_record'
require 'erb'
require File.join(File.dirname(__FILE__), 'app', 'configuration')


task :migrate_database do
  puts "Creating database in #{Aspik::Configuration::DATA_DIRECTORY}/database.db"
  Aspik::Utils.connect_to_database
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
  end
end