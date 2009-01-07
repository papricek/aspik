require 'activerecord'
require 'erb'
require '../app/configuration'

begin
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "#{Aspik::Configuration::DATA_DIRECTORY}/database.db")
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
  puts "For some reason, migration didn't work well."
end
