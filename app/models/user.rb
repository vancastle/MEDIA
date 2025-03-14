class User < ApplicationRecord

  SPECIALTIES = %w[generalist neurologist urologist dermatologist]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patients
  has_many :consultations
  has_many :diagnostics, through: :consultations
  has_many :assignations
  has_many :messages

  validates :specialty, presence: true, inclusion: { in: SPECIALTIES }

  def name
    "#{first_name} #{last_name}"
  end
end
