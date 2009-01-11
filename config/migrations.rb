require 'activerecord'
require 'erb'
load(File.join( File.dirname(__FILE__), '..', 'app', 'configuration.rb' ))

begin
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", 
    :database => File.join( File.dirname(__FILE__), '..', 'data', 'database.rb' ))
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
