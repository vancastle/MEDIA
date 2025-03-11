class Patient < ApplicationRecord
  belongs_to :user
  has_many :consultations, dependent: :destroy
  has_many :diagnostics, through: :consultations
  has_many :assignations, through: :diagnostics

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :user, presence: true
end
