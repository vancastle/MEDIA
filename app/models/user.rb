class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patients
  has_many :consultations
  has_many :diagnostics, through: :consultations
  has_many :assignations
  has_many :messages

  # TODO: validation specialty dans liste prédéfinie
end
