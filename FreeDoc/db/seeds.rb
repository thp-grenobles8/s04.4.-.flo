# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Specialty.destroy_all
JoinTableDoctorSpecialty.destroy_all
10.times do |index|
  City.create(
    name: Faker::Address.city
  )
  puts index
end

10.times do |index|
  Doctor.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    zip_code: Faker::Address.zip_code,
    city: City.all.sample
  )
  puts index
end
#
10.times do |index|
  Patient.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    city: City.all.sample
  )
  puts index
end
#
100.times do |index|
  Appointment.create(
    date: Time.at(rand * Time.now.to_i),
    doctor: Doctor.all.sample,
    patient: Patient.all.sample,
    city: City.all.sample
  )
end


10.times do |index|
  Specialty.create(
    name: ["Allergologie", "Anesthésie-Réanimation", "Anatomie", "Cytologie pathologiques", "Génétique médicale", "Gériatrie" , "Gynécologie médicale"," Gynécologie – Obstétrique"].sample
  )
  puts index
end
#

#

#

10.times do |index|
  JoinTableDoctorSpecialty.create(
    doctor_id: rand(Doctor.first.id..Doctor.last.id),
    specialty_id: rand(Specialty.first.id..Specialty.last.id)
  )
end
