class Ceic < ApplicationRecord
has_many :classrooms
has_many :enrollments
has_many :projects, through: :classrooms

	def short_slug
		letters = self.slug.split('')
		letters[0..5].join('')
	end
end
