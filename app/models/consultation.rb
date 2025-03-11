class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :diagnostics, dependent: :destroy
  has_many :assignations, through: :diagnostics

  validates :starts_at, presence: true
end
