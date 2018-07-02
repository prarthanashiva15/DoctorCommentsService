class AddForeignKeyDoctorsReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :doctors_reviews, :specialties, foreign_key: true
  end
end
