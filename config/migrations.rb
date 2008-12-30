ActiveRecord::Schema.define(:version => 1) do
  create_table :articles do |t|
    t.string :title
    t.text :text
    t.timestamps
  end

end