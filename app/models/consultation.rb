class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :diagnostics, dependent: :destroy
  has_many :assignations, through: :diagnostics

  validates :starts_at, presence: true

  def request
    return "Tu es un expert en medecine

      Voici les symptomes : #{prompt}

      Propose moi un seul diagnostique. Je ne veux pas de listing."
  end
end
