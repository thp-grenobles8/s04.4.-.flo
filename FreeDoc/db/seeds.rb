# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



print "clear City:"
City.destroy_all
puts " ✔"
print "clear Doctor:"
Doctor.destroy_all
puts " ✔"
print "clear Patient:"
Patient.destroy_all
puts " ✔"
print "clear Appointment:"
Appointment.destroy_all
puts " ✔"
print "clear Specialty:"
Specialty.destroy_all
puts " ✔"
print "clear JoinTableDoctorSpecialty:"
JoinTableDoctorSpecialty.destroy_all
puts " ✔\n\n"


print "create city"
10.times do |index|
  City.create(
    name: Faker::Address.city
  )
end
puts " ✔"

print "create Doctor"
10.times do |index|
  Doctor.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    zip_code: Faker::Address.zip_code,
    city: City.all.sample
  )
end
puts " ✔"
#
print "create Patient"
10.times do |index|
  Patient.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    city: City.all.sample
  )
end
puts " ✔"

print "create Appointment"
100.times do |index|
  Appointment.create(
    date: Time.at(rand * Time.now.to_i),
    doctor: Doctor.all.sample,
    patient: Patient.all.sample,
    city: City.all.sample
  )
end
puts " ✔"


print "create Specialty"
10.times do |index|
  Specialty.create(
    name: ["Allergologie", "Anesthésie-Réanimation", "Anatomie", "Cytologie pathologiques", "Génétique médicale", "Gériatrie" , "Gynécologie médicale"," Gynécologie – Obstétrique"].sample
  )
end
puts " ✔"


#

#

print "create JoinTableDoctorSpecialty"
10.times do |index|
  JoinTableDoctorSpecialty.create(
    doctor_id: rand(Doctor.first.id..Doctor.last.id),
    specialty_id: rand(Specialty.first.id..Specialty.last.id)
  )
end
puts " ✔"
