class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :diagnostics, dependent: :destroy
  has_many :assignations, through: :diagnostics

  validates :starts_at, presence: true

  def request
    return <<~PROMPT
      Tu es un expert en médecine
      Je vais te donner des symptômes
      Voici la liste des spécialités connues : #{(User::SPECIALTIES - ["generalist"]).join(", ")}

      Peux tu me proposer 3 diagnostics si jamais les symptômes correspondent a une spécialité ?

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


      Si jamais le diagnostic correspond à aucune spécialité connue, format attendu :

      [
        {
          specialty: "unknown",
          suggested_specialty: "ici la suggestion",
          diagnostic: "ici le diagnostic"
        }
      ]

      Réponds uniquement avec le format attendu.

      Voici les symptômes : #{prompt}
    PROMPT
  end
end
