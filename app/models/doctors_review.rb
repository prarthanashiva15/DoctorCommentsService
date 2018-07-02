class DoctorsReview < ApplicationRecord
  has_many :author
  has_many :doctor
  has_many :specialties
end
