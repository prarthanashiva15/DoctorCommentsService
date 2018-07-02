class CreateDoctorsReviews < ActiveRecord::Migration[5.1]
  def self.up
    fk_opts = { foreign_key: true, index: true, null: false }

    create_table :doctors_reviews do |t|
      t.belongs_to :doctors, fk_opts
      t.belongs_to :authors, fk_opt
      t.string :comments
      t.string :rating
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :doctors_reviews
  end
end
