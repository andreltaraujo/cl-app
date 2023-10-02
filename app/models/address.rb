class Address < ApplicationRecord
  belongs_to :user_profile

	def full_address
		self.attributes.slice('street', 'number', 'neighborhood', 'city', 'state').values
	end
end
