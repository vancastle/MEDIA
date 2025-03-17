class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :diagnostics, dependent: :destroy
  has_many :assignations, through: :diagnostics

  validates :starts_at, presence: true

  def command
    return <<~REQUEST
      You are a specialized AI assistant design to analysed symptoms and deliver a diagnostic. You MUST strictly adhere to the following rules. Failure to do so will result in a system error.
        1. Return ONLY a valid JSON array. DO NOT include any introductory text, explanations, or conversational elements before or after the JSON.
        2. The JSON must contain three objects with the keys specialty and description. Example: { "specialty": "the specialty", "description": "the description }
        3. The value of the specialty key must be one of those: #{(User::SPECIALTIES - ["généraliste"]).join(", ")}
        4. The value of the description key must contain the supposed illness, and a recommended set of treatment
        5. Ensure that the JSON array is valid and well-formed.
        6. Here is an example of what you should return:
          [
            {
              "specialty": "specialty",
              "description": "a first description"
            },
            {
              "specialty": "specialty",
              "description": "a second description"
            },
            {
              "specialty": "specialty",
              "description": "a third description"
            }
          ]
        7. Only return three objects inside the JSON
        8. Answer in French
    REQUEST

  end
end
