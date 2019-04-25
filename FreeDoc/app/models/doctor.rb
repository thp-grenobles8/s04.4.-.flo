class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :join_table_doctor_specialty, dependent: :destroy
  has_many :specialties, through: :join_table_doctor_specialty
  belongs_to :city
end
