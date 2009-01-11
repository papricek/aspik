require 'activerecord'
require 'erb'
load(File.join( File.dirname(__FILE__), '..', 'app', 'configuration.rb' ))

begin
  Aspik::Utils.connect_to_database
  
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
