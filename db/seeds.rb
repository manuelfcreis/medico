# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'csv'

puts 'Cleaning database...'
Medication.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'medicine_list.csv'), encoding: 'ISO-8859-1');
csv = CSV.parse(csv_text.scrub, headers: true, col_sep: ';');

10.times do |i|
  row = csv[i]
  m = Medication.new
  m.name = row['Nome do medicamento']
  m.ingredient = row['Substancia Ativa']
  puts row['Forma farmaceutica']
  m.format = row['Forma farmaceutica']
  m.avg_dose = row['Dosagem']
  m.unit = row['Unit']
  m.package_size = row['Tamanho da embalagem']
  m.price = row['Preco']
  m.generic = row['Generico']
  m.save
end

puts "There are now #{Medication.count} rows in the medications table"

# puts 'Cleaning database...'
# Patient.destroy_all

# puts 'Creating Doctors...'
# 5.times do
# Doctor.create!(first_name: ['Ana', 'Manuel', 'Gabriela', 'Mary'].sample, last_name: ['Silva', 'Reis', 'Preiss', 'Charlotte'].sample, email: Faker::Internet.email, password: "secret")
# end

# puts 'Creating Patients...'
# 5.times do
# Patient.create!(first_name: ['Luis', 'Manuel', 'Joana', 'Maria'].sample, last_name: ['Costa', 'Pereira', 'Fernandes', 'Silva'].sample, email: Faker::Internet.email, password: "secret")
# end

# puts 'Finished!'
