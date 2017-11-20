# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Patient.destroy_all

first_name = ['Ana', 'Manuel', 'Gabriela', 'Mary'].sample
last_name = ['Silva', 'Reis', 'Preiss', 'Charlotte'].sample

puts 'Creating Doctors...'
5.times do
Doctor.create!(first_name: first_name, last_name: last_name, email: Faker::Internet.email, password: "secret")
end

puts 'Creating Patients...'
5.times do
Patient.create!(first_name: first_name, last_name: last_name, email: Faker::Internet.email, password: "secret")
end

puts 'Finished!'
