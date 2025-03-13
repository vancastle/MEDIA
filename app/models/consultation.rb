class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :diagnostics, dependent: :destroy
  has_many :assignations, through: :diagnostics

  validates :starts_at, presence: true

  def request
    return <<~PROMPT
      Tu es un expert en medecine
      Je vais te donner des symptomes
      Voici la liste des spécialites connues : #{(User::SPECIALTIES - ["generalist"]).join(", ")}

      Peux tu me proposer 3 diagnostics si jamais les symptomes correspondent a une specialité ?

      Format attendu :

      [
        {
          "specialty": "urologue",
          "diagnostic": "ici le diagnostic"
        },
        {
          "specialty": "urologue",
          "diagnostic": "ici le diagnostic"
        },
        {
          "specialty": "urologue",
          "diagnostic": "ici le diagnostic"
        }
      ]


      Si jamais le diagnostic correpsond a aucune specialite connue, format attendu :

      [
        {
          specialty: "unkown",
          suggested_specialty: "ici la suugestion",
          diagnostic: "ici le diagnostic"
        }
      ]

      Réponds uniquement avec le format attendu.

      Voici les symptômes : #{prompt}
    PROMPT
  end
end
