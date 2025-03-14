Message.destroy_all
Assignation.destroy_all
Diagnostic.destroy_all
Consultation.destroy_all
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
  "généraliste",
  "généraliste",
  "neurologue",
  "neurologue",
  "neurologue",
  "urologue",
  "urologue",
  "urologue",
  "dermatologue",
  "dermatologue",
  "dermatologue"
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
paul = User.find_by(first_name: "pierre", last_name: "penhard")
pierre = User.find_by(first_name: "paul", last_name: "portier")
cecile = User.find_by(first_name: "cecile", last_name: "veneziani")

# Patient seed
15.times do
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

patients = Patient.all

# Consultation seed

Consultation.create!(
  user_id: thomas.id,
  patient_id: patients[0].id,
  starts_at: DateTime.new(2025, 3, 14, 12, 30)
)

Consultation.create!(
  user_id: thomas.id,
  patient_id: patients[1].id,
  starts_at: DateTime.new(2025, 3, 14, 12, 15)
)

Consultation.create!(
  user_id: thomas.id,
  patient_id: patients[2].id,
  starts_at: DateTime.new(2025, 3, 14, 12, 45)
)

consultations = Consultation.all

# Diagnostic seed
3.times do
  Diagnostic.create!(
    description: Faker::Lorem.paragraph,
    specialty: "dermatologue",
    consultation_id: consultations.first.id
  )
end

diagnostic = Diagnostic.first

# Assignation seed
# statuses = ["accepted", "pending", "declined"]
Assignation.create!(
  user_id: paul.id,
  diagnostic_id: diagnostic.id,
  status: "declined"
)

Assignation.create!(
  user_id: pierre.id,
  diagnostic_id: diagnostic.id,
  status: "pending"
)

assignation = Assignation.create!(
  user_id: cecile.id,
  diagnostic_id: diagnostic.id,
  status: "accepted"
)

patient = patients.first

# Message Seed
Message.create!(
  content: "Bonjour Dr. Veneziani, je me permets de vous transmettre le dossier d'un patient. Auriez-vous de la disponibilité ?",
  assignation_id: assignation.id,
  user_id: thomas.id
)

Message.create!(
  content: diagnostic.description,
  assignation_id: assignation.id,
  user_id: thomas.id
)

Message.create!(
  content: "prénom: #{patient.first_name},\n nom: #{patient.last_name},\n adresse: #{patient.address},\n date de naissance: #{patient.date_of_birth},\n genre: #{patient.gender},\n numéro de téléphone: #{patient.phone_number}",
  assignation_id: assignation.id,
  user_id: thomas.id
)

Message.create!(
  content: "Bonjour Dr. Desmoulins, j'ai des places libres, je peux prendre en charge votre patient dès la semaine prochaine.",
  assignation_id: assignation.id,
  user_id: cecile.id
)
