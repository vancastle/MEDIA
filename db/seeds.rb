# Message.destroy_all
# Assignation.destroy_all
# Diagnostic.destroy_all
# Consultation.destroy_all
Patient.destroy_all
User.destroy_all

# User seed
doctors_first_names = [
  "thomas",
  "julien",
  "diane",
  "mathieu",
  "gautier",
  "nicolas",
  "tristan",
  "nicolas",
  "pierre",
  "paul",
  "cecile"
]

doctors_last_names = [
  "desmoulins",
  "dasilva",
  "johnston",
  "trancoso",
  "david",
  "delfour",
  "monteiro",
  "bischoff",
  "penhard",
  "portier",
  "veneziani"
]

doctors_addresses = [
  "16 Vla Gaudelet, 75011 Paris",
  "20 Rue des Capucins, 69001 Lyon",
  "16 Vla Gaudelet, 75011 Paris",
  "2 Av. des Saules, 59160 Lille",
  "10 Pass. de la Poule Noire, 44000 Nantes",
  "16 Vla Gaudelet, 75011 Paris",
  "2 Rue de la Mabilais, 35000 Rennes",
  "16 Vla Gaudelet, 75011 Paris",
  "107 Cr Balguerie Stuttenberg, 33300 Bordeaux",
  "16 Vla Gaudelet, 75011 Paris",
  "O Local, 18 Port Saint-Etienne, 31500 Toulouse"
]

doctors_specialties = [
  "",
  "",
  "neurologist",
  "neurologist",
  "neurologist",
  "urologist",
  "urologist",
  "urologist",
  "dermatologist",
  "dermatologist",
  "dermatologist"
]

count = doctors_first_names.count

(0...count).each do |index|
  email = "#{doctors_first_names[index]}.#{doctors_last_names[index]}@gamil.com"
  password = doctors_first_names[index] + doctors_last_names[index]
  User.create!(
    first_name: doctors_first_names[index],
    last_name: doctors_last_names[index],
    address: doctors_addresses[index],
    email: email,
    password: password,
    specialty: doctors_specialties[index]
  )
end

thomas = User.first

10.times do
  patient = Patient.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    date_of_birth: Faker::Date.birthday(min_age: 12, max_age: 99),
    gender: Faker::Gender.type,
    phone_number: Faker::PhoneNumber.phone_number
  )
  patient.user = thomas
  patient.save!
end
