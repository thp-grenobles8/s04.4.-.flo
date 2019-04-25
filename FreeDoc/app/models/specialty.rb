class Specialty < ApplicationRecord
  has_many :join_table_doctor_specialty, dependent: :destroy
  has_many :doctors, through: :join_table_doctor_specialty
end
