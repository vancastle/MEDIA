class Message < ApplicationRecord
  belongs_to :user
  belongs_to :assignation

  validates :content, presence: true
end
