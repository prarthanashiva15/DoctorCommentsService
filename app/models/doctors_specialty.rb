class DoctorsSpecialty < ApplicationRecord
  has_many :doctor
  has_many :specialty
end
