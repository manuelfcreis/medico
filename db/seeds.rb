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
    Dose.destroy_all
    Medication.destroy_all

    puts "reading the medication list"
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'medicine_list.csv'), encoding: 'ISO-8859-1');
    csv = CSV.parse(csv_text.scrub, headers: true, col_sep: ';');

    puts "Creating the Medication... This may take a while"
    i = 1
    # 20.times do
    csv.each do |row|
      # row = csv[i]
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
      i += 100
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
answer = ""

until answer == "n"
  puts "Do you want to reboot Users, Appointments and Chats?"
  answer = STDIN.gets.chomp

  if answer == "y"
    puts 'Cleaning Patient and Doctor database...'
    Chat.destroy_all
    Appointment.destroy_all
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
    answer = "n"
  elsif answer != "n"
    puts "Please answer (y/n)"
  end
end
answer = ""

until answer == "n"
  puts "Do you want to reboot Symptoms?"
  answer = STDIN.gets.chomp

  if answer == "y"
    puts 'Cleaning Symptoms...'
    Symptom.destroy_all

    puts "Generating Symptoms..."
    have_list = ["Abdominal pain","Back pain","Chest pain","Otalgia (Earache)","Headache","Chronic pelvic pain","Toothache (ache)","Vaginal (Pain)","Rectal pain","Dermatomal pain"]
    feel_list = ["Chills","Fever","Paresthesia (numbness, tingling, electric tweaks)","Light-headed","Dizzy, about to black out","Dizzy, with the room spinning around me","My mouth is dry","Nauseated","Sick","Sick like I have the flu","Sick like I have to vomit","Short of breath","Sleepy","Sweaty","Thirsty","Tired","Weak"]
    cant_list = ["Breathe normally","hear well","Hear well, sounds are too loud","Hear well, ringing or hissing in my ears","Move one side – arm and/or leg","Pass a bowel action normally","Pass urine normally","Remember normally","See properly","See properly, I have blurred vision","See properly, I have double vision","Sleep normally","Smell things normally","Speak normally","Stop passing watery bowel actions","Stop scratching","Stop sweating","Swallow normally","Taste properly","Walk normally","Write normally"]

    have_list.each do |pain|
      Symptom.create(name: pain, classification: "have")
    end

    feel_list.each do |feel|
      Symptom.create(name: feel, classification: "feel")
    end

    cant_list.each do |cant|
      Symptom.create(name: cant, classification: "can't")
    end

    answer = "n"
  elsif answer != "n"
    puts "Please answer (y/n)"
  end
end
answer = ""

puts 'Finished!'
