class Assignation < ApplicationRecord
  belongs_to :user
  belongs_to :diagnostic
  has_many :messages

  validates :status, presence: true
end
