class Diagnostic < ApplicationRecord
  belongs_to :consultation
  has_many :assignations, dependent: :destroy

  validates :description, presence: true

  
  validates :speciality, presence: true, inclusion: { in: User::SPECIALTIES }

  validates :selected, inclusion: { in: [true, false] }
  validates :specialist_needed, inclusion: { in: [true, false] }
end
