# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'csv'
answer = ""

# Ask if we want to reboot seeds
until answer == "n"
  puts "Do you want to reboot the medication database? (y/n)"
  answer = STDIN.gets.chomp

  if answer == "y"
    puts 'Cleaning medication database...'
    Medication.destroy_all

    puts "reading the medication list"
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'medicine_list.csv'), encoding: 'ISO-8859-1');
    csv = CSV.parse(csv_text.scrub, headers: true, col_sep: ';');

    puts "Creating the Medication... This may take a while"
    csv.each do |row|
      m = Medication.new
      m.name = row['Nome do medicamento']
      m.ingredient = row['Substancia Ativa']
      m.format = row['Forma farmaceutica']
      m.avg_dose = row['Dosagem']
      m.unit = row['Unit']
      m.package_size = row['Tamanho da embalagem']
      m.price = row['Preco']
      m.generic = row['Generico']
      m.save
    end
    answer = "n"
    puts "There are now #{Medication.count} rows in the medications table"
  elsif answer != "n"
    puts "Please answer (y/n)"
  end
end

answer = ""

until answer == "n"
  puts "Do you want to reboot the Specialty database? (y/n)"
  answer = STDIN.gets.chomp

  if answer == "y"
    puts "Clearing Specialties"
    Specialty.destroy_all

    ary = [
      'Radiology',
      'Psychiatry',
      'Pediatrics',
      'Anesthesiology',
      'Orthopaedic Surgery',
      'Internal Medicine',
      'Medical Genetics',
      'Pathology-Anatomic & Clinical',
      'Neurology',
      'Immunology',
      'Plastic Surgery',
      'Thoracic Surgey',
      'Dermatology',
      'Obstetrics & Gynecology',
      'Family Medicine',
      'Emergency Medicine',
      'Otolaryngology',
      'Ophthalmology',
      'Urology',
    ]

    puts 'Creating Specialties'
    ary.each do |s|
      Specialty.create(name: s)
    end
    answer = "n"
  elsif answer != "n"
    puts "Please answer (y/n)"
  end
end

puts 'Cleaning Patient and Doctor database...'
Chat.destroy_all
Patient.destroy_all
Doctor.destroy_all


puts 'Creating Doctors...'
10.times do
  Doctor.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "secret",
  specialty_id: rand(1..10),
  avatar: "http://www.wetpaint.com/wp-content/uploads/2016/08/greys-anatomy-chandra-wilson-miranda-bailey-4.jpg"
  )
end

puts 'Creating Patients...'
10.times do
  Patient.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  sex: ['female', 'male', 'intersex'].sample,
  birthday: Faker::Date.birthday(18, 65),
  password: "secret",
  bloodtype: ["A", "B", "AB", "O"].sample,
  education: ["Master's Degree", "Graduate", "Undergraduate", "Doctoral Degree", "High School"].sample,
  occupation: ["Student", "Teacher", "Anthropologist", "Architect", "Plumber"].sample,
  marital_status: ["Married", "Single", "Divorced", "Widowed"].sample,
  disability: ["none", "High Blood Pressure", "Diabetes", "High Colesterol", "Hepatitis", "Obesity"].sample,
  religion: ["Roman Catholic", "Protestant", "Sunni", "Jew", "Hindu", " jehovah's witness"].sample,
  avatar: "http://bubbamama.com/wp-content/uploads/2013/07/20130722-185719.jpg"
  )
end

puts 'Finished!'
