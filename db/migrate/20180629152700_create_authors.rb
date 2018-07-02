class CreateAuthors < ActiveRecord::Migration[5.1]
  def self.up
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.timestamps
    end
  end

  # execute 'ALTER TABLE authors ADD PRIMARY KEY (author_id);'

  def self.down
    drop_table :authors
  end
end
