class Diagnostic < ApplicationRecord
  belongs_to :consultation
  has_many :assignations, dependent: :destroy

  validates :description, presence: true

  # TODO: validation specialty dans liste prédéfinie (la meme que sur User)
  validates :specialty, presence: true

  validates :selected, inclusion: { in: [true, false] }
  validates :specialist_needed, inclusion: { in: [true, false] }
end
