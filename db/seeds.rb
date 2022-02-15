# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding..."
puts "Creating Patients..."

Patient.create({name: "Gianluca", surname: "Klimmer", birth: "10-09-1995"})
Patient.create({name: "Valentino", surname: "Rusconi", birth: "16-05-1995"})

puts "Patients created."
puts "Creating Appointments..."

Appointment.create({ title: "Blocked", start: "2021-01-04T09:15:00", end: "2021-01-04T09:30:00", patient_id: 1 })
Appointment.create({ title: "Blocked", start: "2021-01-05T10:00:00", end: "2021-01-05T10:30:00", patient_id: 1 })
Appointment.create({ title: "Blocked", start: "2021-01-05T14:30:00", end: "2021-01-05T15:30:00", patient_id: 1 })
Appointment.create({ title: "Blocked", start: "2021-01-06T09:00:00", end: "2021-01-06T09:30:00", patient_id: 1 })
Appointment.create({ title: "Blocked", start: "2021-01-06T10:00:00", end: "2021-01-06T11:30:00", patient_id: 1 })
Appointment.create({ title: "Blocked", start: "2021-01-06T16:30:00", end: "2021-01-06T17:00:00", patient_id: 1 })

puts "Appointments created."
puts "Seeding done."
