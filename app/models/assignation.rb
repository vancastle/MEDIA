class Assignation < ApplicationRecord
  belongs_to :user
  belongs_to :diagnostic
  has_many :messages

  validates :status, presence: true, inclusion: { in: %w[accepted declined pending] }
end
