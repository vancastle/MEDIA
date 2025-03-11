class Assignation < ApplicationRecord
  belongs_to :user
  belongs_to :diagnostic
  has_many :messages

  # TODO: validation statuses dans liste prédéfinie
  validates :status, presence: true
end
