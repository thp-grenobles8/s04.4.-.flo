class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :join_table_doctor_specialty
  has_many :specialties, through: :join_table_doctor_specialty
  belongs_to :city
end
