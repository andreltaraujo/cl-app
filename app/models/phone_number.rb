class PhoneNumber < ApplicationRecord
  belongs_to :user_profile

	validates :number, presence: true, uniqueness: true, format: { with: /\A\(\d{2}\) \d{5}-\d{4}\z/, message: "is invalid" }
end
